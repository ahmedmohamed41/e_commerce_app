import 'dart:async';
import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/widget/product_card.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/brand_cubit.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/category_cubit.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_brand_widget.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;

  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryCubit>(
          create: (context) => getIt<CategoryCubit>()..getCategory(),
        ),
        BlocProvider<BrandCubit>(
          create: (context) => getIt<BrandCubit>()..getBrand(),
        ),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAdsWidget(
              adsImages: adsImages,
              currentIndex: _currentIndex,
              timer: _timer,
            ),
            Column(
              children: [
                CustomSectionBar(sectionNname: 'Categories', function: () {}),
                BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is CategoryError) {
                      return Center(child: Text(state.message));
                    } else if (state is CategorySuccess) {
                      return SizedBox(
                        height: 270.h,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomCategoryWidget(
                              categoryEntity: state.categories[index],
                            );
                          },
                          itemCount: state.categories.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                        ),
                      );
                    }
                    return SizedBox();
                  },
                ),
                SizedBox(height: 12.h),
                CustomSectionBar(sectionNname: 'Brands', function: () {}),
                BlocBuilder<BrandCubit, BrandState>(
                  builder: (context, state) {
                    if (state is BrandLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is BrandError) {
                      return Center(child: Text(state.message));
                    } else if (state is BrandSuccess) {
                      return SizedBox(
                        height: 270.h,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomBrandWidget(
                              brandEntity: state.brands[index],
                            );
                          },
                          itemCount: state.brands.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                        ),
                      );
                    }
                    return SizedBox();
                  },
                ),

                CustomSectionBar(
                  sectionNname: 'Most Selling Products',
                  function: () {},
                ),
                SizedBox(
                  child: SizedBox(
                    height: 360.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const ProductCard(
                          title: "Nike Air Jordon",
                          description:
                              "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
                          rating: 4.5,
                          price: 1100,
                          priceBeforeDiscound: 1500,
                          image: ImageAssets.categoryHomeImage,
                        );
                      },
                      itemCount: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
