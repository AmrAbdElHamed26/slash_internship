import 'package:equatable/equatable.dart';

class ProductDetails extends Equatable {
  final List<String?> allImages;

  final String productName;

  final double productPrice;
  final List<String?> allSizes;
  final List<String?> allMaterials;

  final String brandImage, brandName , brandDescription;

  const ProductDetails(this.allImages, this.allSizes, this.allMaterials,
      {required this.productName,
      required this.productPrice,
      required this.brandImage,
      required this.brandName,
         required this.brandDescription,});

  @override
  List<Object?> get props => [
        allImages,
        allSizes,
        allMaterials,
        productName,
        productPrice,
        brandImage,
        brandName,
    brandDescription,
      ];
}
