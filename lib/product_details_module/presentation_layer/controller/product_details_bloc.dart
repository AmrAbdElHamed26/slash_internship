import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:slash_task/product_details_module/data_layer/models/product_details_data.dart';

import '../../../shared/enums.dart';
import '../../domain_layer/entites/product_details.dart';
import '../../domain_layer/use_cases/get_product_details_use_case.dart';

part 'product_details_event.dart';

part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;

  ProductDetailsBloc(this.getProductDetailsUseCase)
      : super(const ProductDetailsState()) {
    on<SelectSpecificSizeEvent>((event, emit) {
      final updatedState = state.copyWith(
        selectedSizeIndex: event.index,
      );
      emit(updatedState);
    });

    on<SelectSpecificMaterialEvent>((event, emit) {
      final updatedState = state.copyWith(
        selectedMaterialIndex: event.index,
      );

      emit(updatedState);
    });

    on<GetProductDetailsEvent>(_getProductDetails);
  }

  ProductDetails _getProductDetails(
      GetProductDetailsEvent event, Emitter<ProductDetailsState> emit) {
    final result = getProductDetailsUseCase.execute(event.currentProduct);

    emit(state.copyWith(
      currentProduct: result,
      productDetailsState: RequestState.loaded,
    ));

    return result;
  }


}
