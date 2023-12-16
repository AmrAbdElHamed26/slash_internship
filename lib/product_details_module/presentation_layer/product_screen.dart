import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/shared/service_locator.dart';

import 'components/add_to_cart_component.dart';
import 'components/name_salary_component.dart';
import 'components/product_images_scroll_view.dart';
import 'components/select_material_component.dart';
import 'components/select_size_componenet.dart';
import 'controller/product_details_bloc.dart';

/// todo : need handle all text to prevent overflow (maxLines)
class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

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
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => getIt<ProductDetailsBloc>()..add(GetProductDetailsEvent(currentProduct: 1))..add(SelectSpecificSizeEvent(index: 1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImagesScrollView(),
              const NameAndSalaryPart(),
              SelectSizePart(),

              SelectMaterialPart(),

              ///todo : make description

              AddToCartComp(),


            ],
          ),
        ),
      ),
    );
  }
}
