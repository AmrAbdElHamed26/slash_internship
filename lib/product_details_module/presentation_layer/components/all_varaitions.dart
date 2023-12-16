import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/product_details_bloc.dart';

class Variations extends StatelessWidget {
  Variations({Key? key, required this.data , required this.sizeOrMaterial}) : super(key: key);
  final List<String?> data;

  String sizeOrMaterial ;
  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    var widthScreen = MediaQuery.of(context).size.width;

    return SizedBox(
      height: heightScreen * .1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: widthScreen * .6,
            height: 60,
            child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
              builder: (context, state) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    Color sizeColor = state.selectedSizeIndex == index ? const Color(0xFFA3DE48) : const Color(0xFF302F30) ;
                    Color materialColor = state.selectedMaterialIndex == index ? const Color(0xFFA3DE48) : const Color(0xFF302F30) ;


                    return GestureDetector(
                      onTap: (){
                        if(sizeOrMaterial == "size"){
                          BlocProvider.of<ProductDetailsBloc>(context).add(SelectSpecificSizeEvent(index: index));
                        }
                        else {
                          BlocProvider.of<ProductDetailsBloc>(context).add(SelectSpecificMaterialEvent(index: index));

                        }
                      },

                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        width: 70,
                        decoration: BoxDecoration(
                          color:sizeOrMaterial == 'size'?sizeColor :materialColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                            child: Text(
                              data[index]!,
                              style: TextStyle(
                                  color: ((state.selectedSizeIndex == index && sizeOrMaterial =="size") || (state.selectedMaterialIndex == index && sizeOrMaterial =="material")) ? Colors.black : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            )),
                      ),
                    );
                  },
                  itemCount: data.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
