import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cement_industries_dealer/app/constant/EventModel.dart';
import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/app/controllers/cart_controller.dart';
import 'package:cement_industries_dealer/app/routes/app_pages.dart';
import 'package:cement_industries_dealer/app/widget/flutter_toast.dart';
import 'package:cement_industries_dealer/extensions/extension_functions.dart';
import 'package:cement_industries_dealer/utility/sample_data.dart';
import 'package:cement_industries_dealer/utility/widget_util.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<StatefulWidget> createState() => ProductListScreenState();
}

class ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    EventModel.eventBus.on<CartUpdateEvent>().listen((event) async {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Text("Product List", style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)),
        actions: [
          SizedBox(
            width: 30,
            child: Stack(
              children: [
                Align(alignment: Alignment.centerLeft, child: Icon(Icons.shopping_cart, color: themeColor)),
                if (CartController().getTotalQtyInCart() != 0)
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      margin: EdgeInsets.only(top: 2, right: 2),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                      child: Text(
                        "${CartController().getTotalQtyInCart()}",
                        style: TextStyle(color: whiteColor, fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
              ],
            ),
          ).onClick(() {
            if (CartController().getTotalQtyInCart() != 0) {
              Get.toNamed(Routes.PLACE_ORDER_SCREEN);
            } else {
              FlutterToastX.showErrorToastBottom(context, "Cart is empty.");
            }
          }),
          horizontalSpace(15),
        ],
      ),
      body: ListView(
        children: [
          verticalSpace(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: productsList.length,
              shrinkWrap: true,
              itemBuilder:
                  (_, index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: themeColor),
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Image.asset(
                                  productsList[index]["imageUrl"],
                                  width: Get.width,
                                  height: Get.height,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    margin: EdgeInsets.only(bottom: 10, right: 10),
                                    decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.all(Radius.circular(20))),
                                    child: Row(
                                      children: [
                                        Icon(Icons.star, color: whiteColor, size: 16),
                                        horizontalSpace(5),
                                        Text(
                                          "${productsList[index]["points"]}",
                                          style: TextStyle(color: whiteColor, fontSize: 16, fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: Get.width,
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                          decoration: BoxDecoration(
                            color: cardBackColor,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${productsList[index]["name"]}",
                                style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "${productsList[index]["brand"]}",
                                style: TextStyle(color: textColor.withValues(alpha: 0.6), fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              verticalSpace(8),
                              if (CartController().getProductQtyInCart(productsList[index]) == 0) ...[
                                Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.all(Radius.circular(20))),
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: Center(
                                    child: Text(
                                      "Add to Cart",
                                      style: TextStyle(color: whiteColor, fontSize: 16, fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ).onClick(() {
                                  CartController().addProductToCart(productsList[index]);
                                  setState(() {});
                                }),
                              ] else ...[
                                Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(color: themeColor, borderRadius: BorderRadius.all(Radius.circular(20))),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: SizedBox(height: 35, child: Center(child: Icon(Icons.remove, color: whiteColor))).onClick(
                                          () {
                                            CartController().removeProductFromCart(productsList[index]);
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 35,
                                          decoration: BoxDecoration(color: whiteColor, border: Border.all(color: themeColor)),
                                          child: Center(
                                            child: Text(
                                              "${CartController().getProductQtyInCart(productsList[index])}",
                                              style: TextStyle(color: themeColor, fontSize: 18, fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(height: 35, child: Center(child: Icon(Icons.add, color: whiteColor))).onClick(() {
                                          CartController().addProductToCart(productsList[index]);
                                          setState(() {});
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
          verticalSpace(15),
        ],
      ),
    );
  }
}
