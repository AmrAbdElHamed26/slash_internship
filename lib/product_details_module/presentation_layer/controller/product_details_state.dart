part of 'product_details_bloc.dart';

class ProductDetailsState extends Equatable {
  const ProductDetailsState({this.selectedSizeIndex});

  final int? selectedSizeIndex;

  ProductDetailsState copyWith({
    int? selectedSizeIndex,
  }) {
    return ProductDetailsState(
      selectedSizeIndex: selectedSizeIndex ?? this.selectedSizeIndex,
    );
  }

  @override
  List<Object?> get props => [selectedSizeIndex];
}
