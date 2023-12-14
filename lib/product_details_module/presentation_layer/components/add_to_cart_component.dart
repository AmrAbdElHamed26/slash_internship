import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddToCartComp extends StatelessWidget {
  const AddToCartComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  // add to chart
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text("Quantity" , style: TextStyle(color: Colors.white),),
            ),
            /// todo : add plus and muins
          ],),
          Container(
            width: double.infinity,
            height: 30,
            decoration: BoxDecoration(
              color: Color(0xFFA3DE48),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(child: Text("Add To Cart " , style: TextStyle(color: Colors.black , fontSize: 12),)),
          )
        ],),
      );
  }
}
