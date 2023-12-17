import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/product_details_module/presentation_layer/controller/product_details_bloc.dart';
import 'package:slash_task/shared/enums.dart';


class NameAndSalaryPart extends StatelessWidget {
  const NameAndSalaryPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          switch(state.productDetailsState){

            case RequestState.loading:
              return CircularProgressIndicator();
            case RequestState.loaded:
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            state.currentProduct!.productName,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "EGP ${state.currentProduct!.productPrice}",
                            style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xFF141414),
                          ),
                          Positioned(
                            top: 5,
                            left: 5,
                            child: CircleAvatar(
                              radius: 25,
                              child: Image.asset(state.currentProduct!.brandImage),
                            ),
                          ),
                        ]),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            state.currentProduct!.brandName,
                            style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // make sizes scroll view
                ],
              );
            case RequestState.error:
              return CircularProgressIndicator();

          }
        },
      ),
    );
  }
}
