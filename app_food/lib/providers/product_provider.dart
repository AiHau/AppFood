import 'package:app_food/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel productModel;

  List<ProductModel> search = [];
  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productImage: element.get("productImage"),
      productName: element.get("productName"),
      productPrice: element.get("productPrice"),
      productId: element.get("productId"),
      productContent: element.get("productContent"),
    );
    search.add(productModel);
  }

  /////////////// FoodProduct ///////////////////////////////
  List<ProductModel> foodProductList = [];

  fatchFoodsProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("FoodProduct").get();

    for (var element in value.docs) {
      productModels(element);
      newList.add(productModel);
    }
    foodProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getFoodProductDataList {
    return foodProductList;
  }

//////////////// Dink Product ///////////////////////////////////////
  List<ProductModel> dinkProductList = [];

  fatchDinkProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("DrinkProduct").get();

    for (var element in value.docs) {
      productModels(element);
      newList.add(productModel);
    }
    dinkProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getDinkProductDataList {
    return dinkProductList;
  }

  /////////////////// Search Return ////////////
  List<ProductModel> get getAllProductSearch {
    return search;
  }
}
