import 'package:slash_task/product_details_module/domain_layer/entites/product_details.dart';

class ProductDetailsData extends ProductDetails {
  const ProductDetailsData(super.allImages, super.allSizes, super.allMaterials, {required super.productName, required super.productPrice, required super.brandImage, required super.brandName});
 /// todo : use it when access data base
}
