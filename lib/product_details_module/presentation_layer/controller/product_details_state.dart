part of 'product_details_bloc.dart';

class ProductDetailsState extends Equatable {
  const ProductDetailsState(
      {this.selectedSizeIndex,
      this.currentProduct,
      this.productDetailsState = RequestState.loading});

  final int? selectedSizeIndex;
  final ProductDetails? currentProduct;

  final RequestState productDetailsState;

  ProductDetailsState copyWith({
    int? selectedSizeIndex,
    ProductDetails? currentProduct,
    RequestState? productDetailsState,
  }) {
    return ProductDetailsState(
      selectedSizeIndex: selectedSizeIndex ?? this.selectedSizeIndex,
      currentProduct: currentProduct ?? this.currentProduct,
      productDetailsState: productDetailsState ?? this.productDetailsState,
    );
  }

  @override
  List<Object?> get props =>
      [selectedSizeIndex, currentProduct, productDetailsState];
}
