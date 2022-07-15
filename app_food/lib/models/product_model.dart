class ProductModel {
  String productName;
  String productImage;
  int productPrice;
  String productId;
  int? productQuantity;
  String? productContent;
  ProductModel(
      {this.productQuantity,
      required this.productId,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      this.productContent});
}
