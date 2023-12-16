import 'package:slash_task/product_details_module/data_layer/data_source/product_details_data_source.dart';
import 'package:slash_task/product_details_module/domain_layer/entites/product_details.dart';
import 'package:slash_task/product_details_module/domain_layer/repository/base_product_details_repo.dart';

class ProductDetailsRepo extends BaseProductDetailsRepo{

  final BaseProductDetailsDataSource _baseProductDetailsDataSource;
  ProductDetailsRepo( this._baseProductDetailsDataSource);

  @override
  ProductDetails getProductDetails(int currentProduct ) {

    final result = _baseProductDetailsDataSource.getProductDetails(currentProduct) ;

    return result ;
  }

}