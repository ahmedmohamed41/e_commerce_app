import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/brand_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBrandWidget extends StatelessWidget {
  const CustomBrandWidget({super.key, required this.brandEntity});
  final BrandEntity brandEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          child: CachedNetworkImage(
            height: 100,
            width: 100,
            fit: BoxFit.cover,
            imageUrl:brandEntity.image,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// CachedNetworkImage(
//   height: 80,
//   width: 80,
//   fit: BoxFit.cover,
//   imageUrl: ImageAssets.categoryHomeImage,
//   placeholder: (context, url) =>
//       const Center(child: CircularProgressIndicator()),
//   errorWidget: (context, url, error) =>
//       const Center(child: Icon(Icons.error)),
//   imageBuilder: (context, imageProvider) {
//     return Container(
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         image: DecorationImage(
//           image: imageProvider,
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   },
// ),
