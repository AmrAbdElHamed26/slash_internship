import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slash_task/shared/dummy_product_deatils_data.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemBuilder: (context , index){
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10) , color: Colors.white ),
                    child: Image.asset(myCart[index].imagePath),width: 100,height: 100, ),
                Text(myCart[index].name , style: TextStyle(color: Colors.white),),

              ],
            ),
          );
        },
        itemCount: myCart.length, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      ),
    );
  }
}
