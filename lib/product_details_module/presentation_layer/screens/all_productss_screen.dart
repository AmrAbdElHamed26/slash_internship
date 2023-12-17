import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slash_task/product_details_module/domain_layer/entites/product_details.dart';
import 'package:slash_task/product_details_module/presentation_layer/screens/cart_sscreen.dart';
import 'package:slash_task/product_details_module/presentation_layer/screens/product_screen.dart';
import 'package:slash_task/shared/dummy_product_deatils_data.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap : (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartScreen()),
          );
        },child: const Icon(Icons.shopping_cart , color: Colors.white,)),
      ),
      body: GridView.builder(
        itemBuilder: (context , index){
          return Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductScreen(currentProduct : index)),
                );
              },
              child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10) , color: Colors.white),
                  child: Image.asset(allProducts[index].allImages[0]!,width: 300 , height: 300,) ),
            ),
          );
        },
        itemCount: allProducts.length, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      ),
    );
  }
}
