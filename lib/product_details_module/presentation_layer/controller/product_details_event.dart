part of 'product_details_bloc.dart';

abstract class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();

  @override
  List<Object?> get props => [];
}

class SelectSpecificSizeEvent extends ProductDetailsEvent {

  final int index;
  const SelectSpecificSizeEvent({required this.index});
  @override
  List<Object?> get props => [index];

}

class GetProductDetailsEvent extends ProductDetailsEvent{
  final int currentProduct;
  const GetProductDetailsEvent({required this.currentProduct});

  @override
  List<Object?> get props => [currentProduct];


}


class SelectSpecificMaterialEvent extends ProductDetailsEvent {

  final int index;
  const SelectSpecificMaterialEvent({required this.index});
  @override
  List<Object?> get props => [index];

}