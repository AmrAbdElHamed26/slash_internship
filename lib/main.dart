import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/product_details_module/presentation_layer/screens/all_productss_screen.dart';
import 'package:slash_task/product_details_module/presentation_layer/screens/product_screen.dart';
import 'package:slash_task/services/bloc_observer.dart';
import 'package:slash_task/services/service_locator.dart';
import 'package:slash_task/shared/themes.dart';

/// make comp of colors
/// make comp of description
/// change ui (show image animation , and change buttons)
/// make the action of add to cart
/// refactor code
/// can add local data base and fire store
///
void main() {
  ServicesLocator().init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme ,
      home: AllProductScreen(),
    );
  }
}

