import 'dart:developer';

import 'package:ecommerce_app/core/UI/ui_utils.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/core/widget/main_text_field.dart';
import 'package:ecommerce_app/core/widget/validators.dart';
import 'package:ecommerce_app/features/auth/data/models/login_reguest.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSize.s40.h),
                  Center(
                    child: Image.asset(
                      ImageAssets.ecommerceLogo,
                      width: 237.w,
                      height: 90.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: AppSize.s40.h),
                  Text(
                    'Welcome Back To E-COMMERCE',
                    style: getBoldStyle(
                      color: ColorManager.white,
                    ).copyWith(fontSize: FontSize.s22.sp),
                  ),
                  Text(
                    'Please sign in with your mail',
                    style: getLightStyle(
                      color: ColorManager.white,
                    ).copyWith(fontSize: FontSize.s16.sp),
                  ),
                  SizedBox(height: AppSize.s50.h),
                  BuildTextField(
                    controller: _emailController,
                    backgroundColor: ColorManager.white,
                    hint: 'enter your email address',
                    label: 'E-mail address',
                    textInputType: TextInputType.emailAddress,
                    validation: AppValidators.validateEmail,
                  ),
                  SizedBox(height: AppSize.s28.h),
                  BuildTextField(
                    controller: _passwordController,
                    hint: 'enter your password',
                    backgroundColor: ColorManager.white,
                    label: 'Password',
                    validation: AppValidators.validatePassword,
                    isObscured: true,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: AppSize.s8.h),
                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Forget password?',
                          style: getMediumStyle(
                            color: ColorManager.white,
                          ).copyWith(fontSize: FontSize.s18.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s60.h),
                  BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is LoginLoading) {
                        UiUtils.showLoading(context);
                      }
                      if (state is LoginError) {
                        UiUtils.hideLoading(context);
                        UiUtils.showFluttertoast(
                          state.message,
                          ColorManager.error,
                        );
                        // log(state.message);
                      }
                      if (state is LoginSuccess) {
                        UiUtils.hideLoading(context);
                        UiUtils.showFluttertoast(
                          'Sign in Successfully',
                          ColorManager.success,
                        );
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.mainRoute,
                        );
                      }
                    },

                    child: Center(
                      child: SizedBox(
                        // width: MediaQuery.of(context).size.width * .8,
                        child: CustomElevatedButton(
                          // borderRadius: AppSize.s8,
                          isStadiumBorder: false,
                          label: 'Login',
                          backgroundColor: ColorManager.white,
                          textStyle: getBoldStyle(
                            color: ColorManager.primary,
                            fontSize: AppSize.s18,
                          ),
                          onTap: () {
                            if (_formKey.currentState!.validate() == false) {
                              return;
                            }
                            BlocProvider.of<AuthCubit>(context).login(
                              LoginReguest(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
                            log('Sign In Successfully');
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account ?',
                        style: getSemiBoldStyle(
                          color: ColorManager.white,
                        ).copyWith(fontSize: FontSize.s16.sp),
                      ),
                      SizedBox(width: AppSize.s8.w),
                      GestureDetector(
                        onTap: () => Navigator.pushReplacementNamed(
                          context,
                          Routes.signUpRoute,
                        ),
                        child: Text(
                          'Create Account',
                          style: getSemiBoldStyle(color: ColorManager.white)
                              .copyWith(
                                fontSize: FontSize.s16.sp,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                                decorationColor: ColorManager.white,
                                decorationStyle: TextDecorationStyle.solid,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
