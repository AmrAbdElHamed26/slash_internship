import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/product_details_module/presentation_layer/components/product_description.dart';
import 'package:slash_task/services/service_locator.dart';

import '../components/add_to_cart_component.dart';
import '../components/name_salary_component.dart';
import '../components/product_images_scroll_view.dart';
import '../components/select_material_component.dart';
import '../components/select_size_componenet.dart';
import '../controller/product_details_bloc.dart';

class ProductScreen extends StatelessWidget {
   ProductScreen({Key? key , required this.currentProduct}) : super(key: key);


   final int currentProduct ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Product Details",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => getIt<ProductDetailsBloc>()
            ..add(GetProductDetailsEvent(currentProduct: currentProduct))
            ..add(const SelectSpecificSizeEvent(index: 0))..add(const SelectSpecificMaterialEvent(index: 0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImagesScrollView(),
              const NameAndSalaryPart(),
              const SelectSizePart(),

              const SelectMaterialPart(),

              const ProductDescription(),

              const AddToCartComp(),
            ],
          ),
        ),
      ),
    );
  }
}
