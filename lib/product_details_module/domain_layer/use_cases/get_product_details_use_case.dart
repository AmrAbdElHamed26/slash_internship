import 'package:slash_task/product_details_module/domain_layer/entites/product_details.dart';
import 'package:slash_task/product_details_module/domain_layer/repository/base_product_details_repo.dart';

class GetProductDetailsUseCase {
  final BaseProductDetailsRepo baseProductDetailsRepo ;
  GetProductDetailsUseCase(this.baseProductDetailsRepo);

  ProductDetails execute(int currentProduct){
    return baseProductDetailsRepo.getProductDetails(currentProduct);
    
  }

}