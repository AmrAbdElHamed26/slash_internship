import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/product_details_bloc.dart';

class Variations extends StatelessWidget {
  const Variations({Key? key, required this.data}) : super(key: key);
  final List<String?> data;

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
            height: 55,
            child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
              builder: (context, state) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    if (index < data.length) {
                      return GestureDetector(
                        onTap: (){
                          BlocProvider.of<ProductDetailsBloc>(context).add(SelectSpecificSizeEvent(index: index));
                        },
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          width: 70,
                          decoration: BoxDecoration(
                            color: state.selectedSizeIndex == index ? Color(0xFFA3DE48) : Color(0xFF302F30),
                            border: Border.all(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                              child: Text(
                            data[index]!,
                            style: TextStyle(
                                color: state.selectedSizeIndex == index ? Colors.black : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )),
                        ),
                      );
                    } else {
                      return Container();
                    }
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
