import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/product_details_bloc.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({Key? key}) : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool pressed = false ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF303030),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                        child: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.white),
                        onTap: () {

                          pressed = !pressed ;
                          print("now $pressed");
                          setState(() {

                          });
                        }
                    ),
                  ],
                ),
                if (pressed == true)
                  Padding(
                    padding: const EdgeInsets.only(left: 10 , right: 10 , top : 15 , bottom: 10),
                    child: Text(state.currentProduct!.brandName , style: const TextStyle(color: Colors.white, fontSize: 16),),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
