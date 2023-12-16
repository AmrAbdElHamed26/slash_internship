import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../shared/dummy_product_deatils_data.dart';

/// todo : change ui of the list view using Transform
class ProductImagesScrollView extends StatelessWidget {
  ProductImagesScrollView({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController(); // control the first list view from any action in second list view

  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    var widthScreen = MediaQuery.of(context).size.width;

    return SizedBox(
      height: heightScreen * 0.4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Column(
          children: [
            FirstListView(scrollController: _scrollController),
            SecondListView(widthScreen: widthScreen, scrollController: _scrollController),
          ],
        ),
      ),
    );
  }
}

class FirstListView extends StatelessWidget {
  const FirstListView({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,

              scrollDirection: Axis.horizontal,

              itemBuilder: (BuildContext context, int index) {
                if (index < productDetails.allImages.length) {
                  return GestureDetector(
                    onTap: () {

                      showImageViewer(
                        context,
                        Image
                            .asset(productDetails.allImages[index]!)
                            .image,
                        swipeDismissible: false,
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      width: 200,
                      height: double.infinity,
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(
                              productDetails.allImages[index]!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
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
    );
  }
}

class SecondListView extends StatelessWidget {
  const SecondListView({
    super.key,
    required this.widthScreen,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final double widthScreen;
  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: widthScreen * 0.5,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                if (index < productDetails.allImages.length) {
                  return GestureDetector(
                    onTap: () async {
                      _scrollController.animateTo(
                        index * 200,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.bounceOut,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(productDetails.allImages[index]!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
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
    );
  }
}
