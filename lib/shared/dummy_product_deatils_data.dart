import '../product_details_module/domain_layer/entites/product_details.dart';

/*
List<String?>allImages = ["assets/images/1.png","assets/images/2.png","assets/images/3.png"];
List<String?>allSizes = ["4*4" , "5*5" , "6*6"];
List<String?>allMaterials = ["cotton1" , "cotton2","cotton3"];


List<String?>allImages2 = ["assets/images/1.png","assets/images/2.png","assets/images/3.png","assets/images/1.png","assets/images/2.png","assets/images/3.png"];
List<String?>allMaterials2 = ["cotton4" , "cotton5","cotton6"];
List<String?>allSizes2 = ["7*7" , "8*8" , "9*9"];

ProductDetails productDetails = ProductDetails(allImages, allSizes, allMaterials, productName: "Any product", productPrice: 250.0, brandImage: "assets/images/2.png", brandName: "Any brand name");
ProductDetails productDetails1 = ProductDetails(allImages2, allSizes2, allMaterials2, productName: "form index 1 ", productPrice: 2, brandImage: "assets/images/2.png", brandName: "Any brand name2");

*/

List<ProductDetails> allProducts = [
  //pants
  const ProductDetails(
      [
        "assets/images/1.jpg",
        "assets/images/2.jpg",
        "assets/images/3.jpg",
        "assets/images/4.jpg"
      ],
      ["32"],
      ["cotton", "melton"],
      productName:
          "Men's Cargo Pants with Side Pockets and Soft Stretch Material",
      productPrice: 500,
      brandImage: "assets/images/0.jpg",
      brandName: "Cottonil",
      brandDescription: '''Suitable for indoor or use anywhere Made of elastic material for easy movement and comfortable wear
With 2 side pockets, 1 back pocket and 2 knee pockets
Men's Various Size Sweatpants Fit For 50-120K
Features elastic waist and leg soft elastic'''),

  //shoes
  const ProductDetails(
      [
        "assets/images/5.jpg",
        "assets/images/6.jpg",
        "assets/images/7.jpg",
      ],
      ["32" , "34" , "36" ,"38"],
      ["fabric1", "fabric2"],
      productName:
      "Anta mens GRAVITY Sneaker",
      productPrice: 500,
      brandImage: "assets/images/0.jpg",
      brandName: "ANTA Store",
      brandDescription: '''Vamp is made of breathable and supportive yarns. Bigger meshes improve breathability.
Remarkable Cushioning and Rebounding
Sutable for gym, walking, and streetwear.
MESH/SYNTHETIC LEATHER'''),

  // hats
  const ProductDetails(
      [
        "assets/images/8.jpg",
        "assets/images/9.jpg",
        "assets/images/10.jpg",
      ],
      ["32" , "34"],
      ["mat1", "mat2" , "mat3"],
      productName:
      "Generic Retro Sun Hat for Men and Women Travel Sun Hat with British Sun Hat Masks for Birthday Adults",
      productPrice: 500,
      brandImage: "assets/images/0.jpg",
      brandName: "ANTA Store",
      brandDescription: '''❥ Features: Superior Quality, Thicker Points, More Beautiful and Durable. . Vintage And Classic Washing Styles Never Go Out Of Fashion.
❥ Occasion: Everyday, Travel, Home, Holiday, Holiday, Etc.
❥Soft Sweatband Inner Lining, Lightweight/Durable/Smooth/Comfortable. Unisex, Suitable for Adults
❥ Due to lighting conditions or display effects, the colour of the product may be slightly different from the image'''),

  // shirts
  const ProductDetails(
      [
        "assets/images/11.jpg",
        "assets/images/12.jpg",
        "assets/images/13.jpg",
        "assets/images/14.jpg",

      ],
      ["small" , "large"],
      ["cotton"],
      productName:
      "Hero Basic Mens Round Neck Short Sleeve Plain Undershirt",
      productPrice: 500,
      brandImage: "assets/images/0.jpg",
      brandName: "ANTA Store",
      brandDescription: '''Western
Short Sleeve Shapewear T-Shirt
Hero Basic Crow Neck Short-Sleeve Solid T-shirt'''),


];

List<CartItem> myCart = [];

class CartItem {
  int id;

  int productVariationId;

  int quantity;

  String imagePath;

  String name;

  CartItem(
      {required this.id,
      required this.productVariationId,
      required this.quantity,
      required this.imagePath,
      required this.name});
}
