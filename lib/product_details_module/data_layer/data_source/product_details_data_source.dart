import 'package:slash_task/shared/dummy_product_deatils_data.dart';

import '../../domain_layer/entites/product_details.dart';

abstract class BaseProductDetailsDataSource {
  ProductDetails getProductDetails(int currentProduct);

}

class ProductDetailsDataSource extends BaseProductDetailsDataSource{
  @override
  ProductDetails getProductDetails(int currentProduct) {

    return allProducts[currentProduct];
  }

}