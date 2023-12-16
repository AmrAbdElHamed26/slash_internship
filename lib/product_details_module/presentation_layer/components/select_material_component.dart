import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/product_details_module/presentation_layer/components/all_varaitions.dart';

import '../../../shared/enums.dart';
import '../controller/product_details_bloc.dart';

class SelectMaterialPart extends StatelessWidget {
  const SelectMaterialPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Select Material ",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
            switch(state.productDetailsState){

              case RequestState.loading:
                return const CircularProgressIndicator();
              case RequestState.loaded:{
                if(state.currentProduct!.allMaterials.isNotEmpty) {
                  return Variations(data: state.currentProduct!.allMaterials , sizeOrMaterial: "material",);
                } else {
                  return Container();
                }
              }
              case RequestState.error:
                return const CircularProgressIndicator();
            }
          },
        ),


      ],
    );
  }
}
