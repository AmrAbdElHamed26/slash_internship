import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/dummy_product_deatils_data.dart';

class NameAndSalaryPart extends StatelessWidget {
  const NameAndSalaryPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(productDetails.productName , style: const TextStyle(color: Colors.white , fontSize: 22 , fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("EGP ${productDetails.productPrice}" , style: const TextStyle(color: Colors.white , fontSize: 16 ),),
                ),

              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    const CircleAvatar(radius: 30,backgroundColor: Color(0xFF141414),),
                    Positioned(
                      top:5,
                      left: 5,
                      child: CircleAvatar(
                        radius: 25,
                        child: Image.asset(productDetails.brandImage),
                      ),
                    ),

                  ]
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(productDetails.brandName, style: const TextStyle(color: Colors.white , fontSize: 16 ),),
                ),

              ],
            ),
            // make sizes scroll view
          ],
        ),
      );
  }
}
