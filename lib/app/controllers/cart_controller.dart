class CartController {
  static final CartController _instance = CartController._internal();

  CartController._internal();

  List<Map<String, dynamic>> cartProduct = [];

  factory CartController() {
    return _instance;
  }

  Future<void> addProductToCart(Map<String, dynamic> product) async {
    cartProduct.add(product);
  }

  Future<void> removeProductFromCart(Map<String, dynamic> product) async {
    int indexOfProduct = cartProduct.indexWhere((p) {
      return p["name"] == product["name"];
    });
    cartProduct.removeAt(indexOfProduct);
  }

  int get getTotalPoints {
    var productPoint = cartProduct.fold(0, (sum, item) => sum + int.parse(item["points"].toString()));
    return productPoint;
  }

  int getTotalQtyInCart() {
    return cartProduct.length;
  }

  int getProductQtyInCart(Map<String, dynamic> product) {
    return cartProduct.where((p) => p["name"] == product["name"]).length;
  }

  void clearCart() {
    cartProduct.clear();
  }
}
