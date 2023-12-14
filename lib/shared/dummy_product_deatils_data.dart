

import '../product_details_module/domain_layer/entites/product_details.dart';

List<String?>allImages = ["assets/images/1.png","assets/images/2.png","assets/images/3.png"];
List<String?>allSizes = ["4*4" , "5*5" , "6*6"];
List<String?>allMaterials = ["cotton1" , "cotton2","cotton3"];

ProductDetails productDetails = ProductDetails(allImages, allSizes, allMaterials, productName: "Any product", productPrice: 250.0, brandImage: "assets/images/2.png", brandName: "Any brand name");