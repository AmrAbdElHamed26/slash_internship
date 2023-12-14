import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/dummy_product_deatils_data.dart';

class SelectMaterialPart extends StatelessWidget {
  const SelectMaterialPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthScreen  = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    return Column(
      children: [
        // material scroll view
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
        SizedBox(
          height: heightScreen*.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: widthScreen * .6,
                height: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    if (index < productDetails.allImages.length) {
                      return Container(
                        margin: EdgeInsets.all(8.0),
                        width: 75,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFFA3DE48),
                          border: Border.all(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(child: Text(productDetails.allMaterials[index]! , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 12),)),
                      );
                    } else {
                      return Container();
                    }
                  },
                  itemCount: productDetails.allImages.length,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
