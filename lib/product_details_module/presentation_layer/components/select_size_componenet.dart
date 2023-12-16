import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/product_details_module/presentation_layer/components/all_varaitions.dart';
import 'package:slash_task/product_details_module/presentation_layer/controller/product_details_bloc.dart';
import 'package:slash_task/shared/enums.dart';


class SelectSizePart extends StatelessWidget {
  const SelectSizePart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // size scroll view
      const Padding(
        padding: EdgeInsets.all(12),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Select Size ", style: TextStyle(color: Colors.white),),
            Text("Size Chart ", style: TextStyle(color: Colors.white),)
          ],),
      ),

      // for size
      BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          switch(state.productDetailsState){

            case RequestState.loading:
              return const CircularProgressIndicator();
            case RequestState.loaded:{
              if(state.currentProduct!.allSizes.isNotEmpty) {
                return Variations(data: state.currentProduct!.allSizes , sizeOrMaterial: "size",);
              } else {
                return Container();
              }
            }
            case RequestState.error:
              return const CircularProgressIndicator();
          }
        },
      ),

    ],);
  }
}
