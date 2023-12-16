

import '../product_details_module/domain_layer/entites/product_details.dart';

List<String?>allImages = ["assets/images/1.png","assets/images/2.png","assets/images/3.png"];
List<String?>allSizes = ["4*4" , "5*5" , "6*6"];
List<String?>allMaterials = ["cotton1" , "cotton2","cotton3"];


List<String?>allImages2 = ["assets/images/1.png","assets/images/2.png","assets/images/3.png","assets/images/1.png","assets/images/2.png","assets/images/3.png"];
List<String?>allMaterials2 = ["cotton4" , "cotton5","cotton6"];
List<String?>allSizes2 = ["7*7" , "8*8" , "9*9"];

ProductDetails productDetails = ProductDetails(allImages, allSizes, allMaterials, productName: "Any product", productPrice: 250.0, brandImage: "assets/images/2.png", brandName: "Any brand name");
ProductDetails productDetails1 = ProductDetails(allImages2, allSizes2, allMaterials2, productName: "form index 1 ", productPrice: 2, brandImage: "assets/images/2.png", brandName: "Any brand name2");


List<ProductDetails>allProducts = [productDetails ,productDetails1 ,productDetails];