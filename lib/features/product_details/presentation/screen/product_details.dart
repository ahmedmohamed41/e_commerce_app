import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_color.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_description.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_item.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_label.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_rating.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_size.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_slider.dart';
import 'package:ecommerce_app/features/products_screen/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int productCounter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
          style: getMediumStyle(
            color: ColorManager.appBarTitleColor,
          ).copyWith(fontSize: 20.sp),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(IconsAssets.icSearch),
              color: ColorManager.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductSlider(
                items: widget.productEntity.images
                    .map((e) => ProductItem(imageUrl: e))
                    .toList(),
                initialIndex: widget.productEntity.images.length,
              ),
              SizedBox(height: 24.h),
              ProductLabel(
                productName: widget.productEntity.title,
                productPrice:
                    'EGP ${widget.productEntity.priceAfterDiscount ?? widget.productEntity.price}',
              ),
              SizedBox(height: 16.h),
              ProductRating(
                productCounter: productCounter,
                decreament: (_) {
                  if (productCounter <= 1) {
                    productCounter = 1;
                  } else {
                    productCounter--;
                  }
                  setState(() {});
                },
                increament: (_) {
                  productCounter++;
                  setState(() {});
                },
                productBuyers: '${widget.productEntity.sold ?? '0'}',
                productRating:
                    '${widget.productEntity.ratingsAverage} ${widget.productEntity.ratingsQuantity}',
              ),
              SizedBox(height: 16.h),
              ProductDescription(
                productDescription: widget.productEntity.description,
              ),
              ProductSize(size: const [35, 38, 39, 40], onSelected: () {}),
              SizedBox(height: 20.h),
              Text(
                'Color',
                style: getMediumStyle(
                  color: ColorManager.appBarTitleColor,
                ).copyWith(fontSize: 18.sp),
              ),
              ProductColor(
                color: const [
                  Colors.red,
                  Colors.blueAccent,
                  Colors.green,
                  Colors.yellow,
                ],
                onSelected: () {},
              ),
              SizedBox(height: 48.h),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Total price',
                        style: getMediumStyle(
                          color: ColorManager.primary.withValues(alpha: 0.6),
                        ).copyWith(fontSize: 18.sp),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'EGP ${widget.productEntity.priceAfterDiscount == null ? (widget.productEntity.price * productCounter) : (widget.productEntity.priceAfterDiscount! * productCounter)}',
                        style: getMediumStyle(
                          color: ColorManager.appBarTitleColor,
                        ).copyWith(fontSize: 18.sp),
                      ),
                    ],
                  ),
                  SizedBox(width: 33.w),
                  Expanded(
                    child: CustomElevatedButton(
                      label: 'Add to cart',
                      onTap: () {},
                      prefixIcon: Icon(
                        Icons.add_shopping_cart_outlined,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
