import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:slash_task/product_details_module/presentation_layer/controller/product_details_bloc.dart';
import 'package:slash_task/shared/enums.dart';

class ProductImagesScrollView extends StatelessWidget {
  ProductImagesScrollView({Key? key}) : super(key: key);

  final ScrollController _scrollController =
      ScrollController(); // control the first list view from any action in second list view

  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    var widthScreen = MediaQuery.of(context).size.width;

    return SizedBox(
      height: heightScreen * 0.4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
            switch (state.productDetailsState) {
              case RequestState.loading:
                return CircularProgressIndicator();
              case RequestState.loaded:
                return Column(
                  children: [
                    FirstListView(
                        scrollController: _scrollController,
                        images: state.currentProduct!.allImages),
                    SecondListView(
                        widthScreen: widthScreen,
                        scrollController: _scrollController,
                        images: state.currentProduct!.allImages),
                  ],
                );
              case RequestState.error:
                return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

class FirstListView extends StatelessWidget {
  const FirstListView({
    super.key,
    required ScrollController scrollController,
    required this.images,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final List<String?> images;

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
                if (index < images.length) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 1000),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: GestureDetector(
                            onTap: () {
                              showImageViewer(
                                context,
                                Image.asset(images[index]!).image,
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
                                  image: AssetImage(images[index]!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ));
                } else {
                  return Container();
                }
              },
              itemCount: images.length,
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
    required this.images,
  }) : _scrollController = scrollController;

  final double widthScreen;
  final ScrollController _scrollController;
  final List<String?> images;

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
            child: ScrollSnapList(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                if (index < images.length) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 1000),
                    child: ScaleAnimation(
                      child: GestureDetector(
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
                              color: const Color(0xFFB8EE2E),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage(images[index]!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
              itemCount: images.length, itemSize: 150, onItemFocus: (int) {  }, dynamicItemSize: true,

            ),
          ),
        ],
      ),
    );
  }
}
