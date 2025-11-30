import 'package:ecommerce_app/features/main_layout/home/data/models/brand_response/brand_response.dart';

abstract class BrandRemoteDataSource {
 Future<BrandResponse> getBrands();
}
