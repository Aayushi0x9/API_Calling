import 'package:api_calling/model/product_model.dart';
import 'package:api_calling/services/helper.dart';
import 'package:flutter/cupertino.dart';

class ProductController with ChangeNotifier {
  List<ProductModel> productList = [];

  ProductController() {
    loadProducts();
  }

  Future<void> loadProducts() async {
    Helper helper = Helper();
    productList = await helper.getAllProducts() ?? [];
    notifyListeners();
  }
}
