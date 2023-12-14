import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slash_task/product_details_module/presentation_layer/components/all_varaitions.dart';

import '../../../shared/dummy_product_deatils_data.dart';

class SelectSizePart extends StatelessWidget {
  const SelectSizePart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Column(children: [
      // size scroll view
      const Padding(
        padding: EdgeInsets.all(12),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Select Size ", style: TextStyle(color: Colors.white ),),Text("Size Chart ", style: TextStyle(color: Colors.white ),)],),
      ),

      // for size
      Variations(data:productDetails.allSizes),

    ],);
  }
}
