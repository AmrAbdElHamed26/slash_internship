import 'package:slash_task/product_details_module/domain_layer/entites/product_details.dart';


abstract class BaseProductDetailsRepo{

  ProductDetails getProductDetails(int currentProduct );
}