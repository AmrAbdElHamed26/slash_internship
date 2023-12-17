import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:slash_task/product_details_module/domain_layer/entites/product_details.dart';
import 'package:slash_task/product_details_module/presentation_layer/controller/product_details_bloc.dart';
import 'package:slash_task/product_details_module/presentation_layer/screens/cart_sscreen.dart';
import 'package:slash_task/shared/dummy_product_deatils_data.dart';


class AddToCartComp extends StatefulWidget {
  const AddToCartComp({Key? key}) : super(key: key);

  @override
  _AddToCartCompState createState() => _AddToCartCompState();
}

class _AddToCartCompState extends State<AddToCartComp> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Quantity",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        quantity = quantity > 0 ? quantity - 1 : 0;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: quantity == 0 ? Colors.grey : Colors.transparent,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      child: const Text(
                        "-",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    color: Colors.white,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      quantity.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    width: 1,
                    color: Colors.white,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        quantity += 1;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      child: const Text(
                        "+",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
  builder: (context, state) {
    return GestureDetector(
            onTap: (){
              /// todo : when press this button i need to get min number(selected color , selected size , selected material ) this number will be the max quantity that can user add to his cart
              ///
              /// depending on backend , i can get data as a pair of data <String , int>
              /// {"black,10"}

              /// todo : go to next page and use bloc to get the data the i stored from the state class i have stored (select size and material index , and add the quantity) i didn't need to
              /// make new model i have stored the data that i selected before

              if(quantity > 0 ){
                showToast("Product added To Your Cart,Successfully" , context:context ,    curve: Curves.elasticOut,
                  position: StyledToastPosition.bottom,
                  backgroundColor: const Color(0x99000000),
                  borderRadius: BorderRadius.circular(5.0),
                );

                /// add any data , change it when dealing with real data
                myCart.add(CartItem(id: 123, productVariationId:123 , quantity: 1 , imagePath: state.currentProduct!.allImages[0]! , name: state.currentProduct!.productName));


              }
              

            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                width: double.infinity,
                height: widthScreen * .1,
                decoration: BoxDecoration(
                  color: const Color(0xFFA3DE48),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    "Add To Cart ",
                    style: TextStyle(color: Colors.black, fontSize: 12 , fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          );
  },
),
        ],
      ),
    );
  }
}
