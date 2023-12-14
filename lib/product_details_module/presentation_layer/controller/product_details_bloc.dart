
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {


  ProductDetailsBloc():super(const ProductDetailsState()){
    on<SelectSpecificSizeEvent>((event, emit) => emit(ProductDetailsState(selectedSizeIndex: event.index ))
    );
  }
}
