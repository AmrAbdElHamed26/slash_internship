import 'package:flutter/material.dart';
import 'package:slash_task/product_details_module/presentation_layer/product_screen.dart';
import 'package:slash_task/shared/themes.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme ,
      home: ProductScreen(),
    );
  }
}

