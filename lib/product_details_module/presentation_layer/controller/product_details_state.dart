part of 'product_details_bloc.dart';

class ProductDetailsState extends Equatable {
  const ProductDetailsState(
      {this.selectedSizeIndex,
        this.selectedMaterialIndex,
      this.currentProduct,
      this.productDetailsState = RequestState.loading,
      });

  final int? selectedSizeIndex;
  final int ? selectedMaterialIndex ;
  final ProductDetails? currentProduct;
  final RequestState productDetailsState;

  ProductDetailsState copyWith({
    int? selectedSizeIndex,
    int ? selectedMaterialIndex,
    ProductDetails? currentProduct,
    RequestState? productDetailsState,
    bool ?pressShowDescriptionButton ,
  }) {
    return ProductDetailsState(
      selectedSizeIndex: selectedSizeIndex ?? this.selectedSizeIndex,
      selectedMaterialIndex : selectedMaterialIndex ?? this.selectedMaterialIndex,
      currentProduct: currentProduct ?? this.currentProduct,
      productDetailsState: productDetailsState ?? this.productDetailsState,
    );
  }

  @override
  List<Object?> get props =>
      [selectedSizeIndex, currentProduct, productDetailsState , selectedMaterialIndex ];
}

