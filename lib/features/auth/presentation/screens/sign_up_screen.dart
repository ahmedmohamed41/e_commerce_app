import 'dart:developer';
import 'package:ecommerce_app/core/UI/ui_utils.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/data/models/register_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController _nameController;

  late final TextEditingController _phoneController;

  late final TextEditingController _emailController;

  late final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _phoneController.dispose();
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
                  BuildTextField(
                    controller: _nameController,
                    backgroundColor: ColorManager.white,
                    hint: 'enter your full name',
                    label: 'Full Name',
                    textInputType: TextInputType.name,
                    validation: AppValidators.validateFullName,
                  ),
                  SizedBox(height: AppSize.s18.h),
                  BuildTextField(
                    controller: _phoneController,
                    hint: 'enter your mobile no.',
                    backgroundColor: ColorManager.white,
                    label: 'Mobile Number',
                    validation: AppValidators.validatePhoneNumber,
                    textInputType: TextInputType.phone,
                  ),
                  SizedBox(height: AppSize.s18.h),
                  BuildTextField(
                    controller: _emailController,
                    hint: 'enter your email address',
                    backgroundColor: ColorManager.white,
                    label: 'E-mail address',
                    validation: AppValidators.validateEmail,
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: AppSize.s18.h),
                  BuildTextField(
                    controller: _passwordController,
                    hint: 'enter your password',
                    backgroundColor: ColorManager.white,
                    label: 'password',
                    validation: AppValidators.validatePassword,
                    isObscured: true,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(height: AppSize.s50.h),
                  BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is RegisterLoading) {
                        UiUtils.showLoading(context);
                      }
                      if (state is RegisterError) {
                        UiUtils.hideLoading(context);
                        UiUtils.showFluttertoast(
                          state.message,
                          ColorManager.error,
                        );
                      }
                      if (state is RegisterSuccess) {
                        UiUtils.hideLoading(context);
                        UiUtils.showFluttertoast(
                          'Sign Up Successfully',
                          ColorManager.success,
                        );
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.signInRoute,
                        );
                      }
                    },
                    child: Center(
                      child: SizedBox(
                        height: AppSize.s60.h,
                        width: MediaQuery.of(context).size.width * .9,
                        child: CustomElevatedButton(
                          // borderRadius: AppSize.s8,
                          label: 'Sign Up',
                          backgroundColor: ColorManager.white,
                          textStyle: getBoldStyle(
                            color: ColorManager.primary,
                            fontSize: AppSize.s20,
                          ),
                          onTap: () {
                            if (_formKey.currentState!.validate() == false) {
                              return;
                            }
                            BlocProvider.of<AuthCubit>(context).register(
                              RegisterRequest(
                                email: _emailController.text,
                                name: _nameController.text,
                                password: _passwordController.text,
                                rePassword: _passwordController.text,
                                phone: _phoneController.text,
                              ),
                            );
                            log('Sign Up Successfully');
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
                        'have an account ?',
                        style: getSemiBoldStyle(
                          color: ColorManager.white,
                        ).copyWith(fontSize: FontSize.s16.sp),
                      ),
                      SizedBox(width: AppSize.s8.w),
                      GestureDetector(
                        onTap: () => Navigator.pushReplacementNamed(
                          context,
                          Routes.signInRoute,
                        ),
                        child: Text(
                          'Sign In Account',
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
