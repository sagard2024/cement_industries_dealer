import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:get/get.dart';
import 'package:cement_industries_dealer/app/routes/app_pages.dart';

class OrderPlacementScreen extends StatefulWidget {
  const OrderPlacementScreen({super.key});

  @override
  State<OrderPlacementScreen> createState() => _OrderPlacementScreenState();
}

class _OrderPlacementScreenState extends State<OrderPlacementScreen> {
  List<String> selectedBrands = [];
  List<String> selectedColors = [];
  List<String> selectedLengths = [];
  bool? productSelected;
  bool confirmOrder = false;

  Map<int, int> productQuantities = {};
  Map<int, bool> productSelections = {};
  Map<int, TextEditingController> quantityControllers = {};

  final List<String> brands = ['Category 1', 'Category 2', 'Category 3'];
  final List<String> colors = ['Grey', 'White', 'Off-White'];
  final List<String> weights = ['25kg', '40kg', '50kg'];

  final List<Map<String, dynamic>> allProducts = [
    {
      'name': 'UltraMax Cement',
      'brand': 'Category 1',
      'color': 'Grey',
      'weight': '50kg',
      'image': 'https://images.moneycontrol.com/static-mcnews/2018/02/Budget-2018_cement-770x433.jpg?impolicy=website&width=770&height=431',
      'quantity': '10',
    },
    {
      'name': 'Duracrete 500',
      'brand': 'Category 2',
      'color': 'Grey',
      'weight': '50kg',
      'image': 'https://images.moneycontrol.com/static-mcnews/2018/02/Budget-2018_cement-770x433.jpg?impolicy=website&width=770&height=431',
      'quantity': '7',
    },
    {
      'name': 'StrongMix Pro',
      'brand': 'Category 3',
      'color': 'Grey',
      'weight': '40kg',
      'image': 'https://images.moneycontrol.com/static-mcnews/2018/02/Budget-2018_cement-770x433.jpg?impolicy=website&width=770&height=431',
      'quantity': '5',
    },
    {
      'name': 'StoneBond Xtra',
      'brand': 'Category 1',
      'color': 'Grey',
      'weight': '50kg',
      'image': 'https://images.moneycontrol.com/static-mcnews/2018/02/Budget-2018_cement-770x433.jpg?impolicy=website&width=770&height=431',
      'quantity': '8',
    },
    {
      'name': 'MegaBind Cement',
      'brand': 'Category 3',
      'color': 'Grey',
      'weight': '50kg',
      'image': 'https://images.moneycontrol.com/static-mcnews/2018/02/Budget-2018_cement-770x433.jpg?impolicy=website&width=770&height=431',
      'quantity': '6',
    },
    {
      'name': 'FortiCem Platinum',
      'brand': 'Category 1',
      'color': 'Off-White',
      'weight': '40kg',
      'image': 'https://images.moneycontrol.com/static-mcnews/2018/02/Budget-2018_cement-770x433.jpg?impolicy=website&width=770&height=431',
      'quantity': '9',
    },
    {
      'name': 'PowerBuild Max',
      'brand': 'Category 3',
      'color': 'White',
      'weight': '50kg',
      'image': 'https://images.moneycontrol.com/static-mcnews/2018/02/Budget-2018_cement-770x433.jpg?impolicy=website&width=770&height=431',
      'quantity': '2',
    },
    {
      'name': 'RockSure 360',
      'brand': 'Category 1',
      'color': 'Grey',
      'weight': '50kg',
      'image': 'https://images.moneycontrol.com/static-mcnews/2018/02/Budget-2018_cement-770x433.jpg?impolicy=website&width=770&height=431',
      'quantity': '11',
    },
    {
      'name': 'CemXpert Supreme',
      'brand': 'Category 2',
      'color': 'Off-White',
      'weight': '40kg',
      'image': 'https://images.moneycontrol.com/static-mcnews/2018/02/Budget-2018_cement-770x433.jpg?impolicy=website&width=770&height=431',
      'quantity': '6',
    },
  ];

  List<Map<String, dynamic>> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = List.from(allProducts);

    for (int i = 0; i < allProducts.length; i++) {
      productQuantities[i] = 1;
      productSelections[i] = false; // Changed from productConfirmations
      quantityControllers[i] = TextEditingController(text: '0');
    }
  }

  @override
  void dispose() {
    quantityControllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  void applyFilters() {
    setState(() {
      if (selectedBrands.isEmpty && selectedColors.isEmpty && selectedLengths.isEmpty) {
        filteredProducts = List.from(allProducts);
      } else {
        filteredProducts = allProducts.where((product) {
          bool matchesBrand = selectedBrands.isEmpty || selectedBrands.contains(product['brand']);
          bool matchesColor = selectedColors.isEmpty || selectedColors.contains(product['color']);
          bool matchesLength = selectedLengths.isEmpty || selectedLengths.contains(product['length']);

          return matchesBrand && matchesColor && matchesLength;
        }).toList();
      }
    });
  }

  void removeFilter(String filterType, String value) {
    setState(() {
      switch (filterType) {
        case 'brand':
          selectedBrands.remove(value);
          break;
        case 'color':
          selectedColors.remove(value);
          break;
        case 'length':
          selectedLengths.remove(value);
          break;
      }
      applyFilters();
    });
  }

  // New method to place order for multiple products
  void placeMultipleOrders() {
    bool hasSelectedProducts = false;
    List<String> errorMessages = [];
    List<int> successfulProducts = [];

    // productSelections.forEach((index, isSelected) {
    //   if (isSelected) {
    //     hasSelectedProducts = true;
    //
    //     final productIndex = allProducts.indexWhere((p) =>
    //     p['name'] == allProducts[index]['name'] &&
    //         p['brand'] == allProducts[index]['brand']);
    //
    //     final product = allProducts[productIndex];
    //
    //     int requestedQuantity = productQuantities[index]!;
    //     int availableQuantity = int.tryParse(product['quantity'].toString()) ?? 0;
    //
    //     if (requestedQuantity > availableQuantity) {
    //       errorMessages.add('${product['brand']} ${product['length']} Sqmm: Only $availableQuantity unit(s) available');
    //     } else {
    //       successfulProducts.add(index);
    //     }
    //   }
    // });

    if (confirmOrder == false) {
      Get.snackbar(
        'Confirmation!',
        'Please select the checkbox for confirming the order.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(15),
      );
      return;
    }

    Get.toNamed(Routes.DELIVERY_INFORMATION);

    // If there are any quantity errors
    if (errorMessages.isNotEmpty) {
      Get.snackbar(
        'Insufficient Stock',
        errorMessages.join('\n'),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(15),
        duration: const Duration(seconds: 4),
      );
      return;
    }

    if (successfulProducts.isNotEmpty) {
      Get.snackbar(
        'Order Placed Successfully',
        'Your order for ${successfulProducts.length} product(s) has been placed',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(15),
      );

      setState(() {
        for (var index in successfulProducts) {
          productSelections[index] = false;
          productQuantities[index] = 1;
          quantityControllers[index]!.text = '0';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Text(
            "Order Placement",
            style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: textColor),
            onPressed: () {
              _showFilterBottomSheet();
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (selectedBrands.isNotEmpty || selectedColors.isNotEmpty || selectedLengths.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Active Filters:",
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ...selectedBrands.map((brand) => filterChip('brand', brand)),
                      ...selectedColors.map((color) => filterChip('color', color)),
                      ...selectedLengths.map((length) => filterChip('length', '$length Sqmm')),
                    ],
                  ),
                ],
              ),
            ),

          Expanded(
            child: filteredProducts.isEmpty
                ? Center(
              child: Text(
                "No products match your filters",
                style: TextStyle(color: textColor, fontSize: 16),
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                final origIndex = allProducts.indexWhere(
                        (p) => p['name'] == product['name'] && p['brand'] == product['brand']
                );
                return productCard(origIndex, product);
              },
            ),
          ),

          Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: confirmOrder,
                    onChanged: (bool? value) {
                      if (productSelected==null || productSelected == false) {
                        Get.snackbar(
                          'Quantity Selected for product is zero',
                          'Please input quantity at least one product to place an order',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                          snackPosition: SnackPosition.BOTTOM,
                          margin: const EdgeInsets.all(15),
                        );
                        return;
                      }
                      setState(() {
                        confirmOrder = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      "Confirm the order by checking the box",
                      style: TextStyle(color: textColor, fontSize: 14),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: placeMultipleOrders,
                    child: const Text(
                      "Place Order",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget filterChip(String type, String label) {
    return Chip(
      backgroundColor: themeColor.withOpacity(0.1),
      label: Text(label, style: TextStyle(color: textColor)),
      deleteIcon: const Icon(Icons.close, size: 18),
      onDeleted: () => removeFilter(type, type == 'length' ? label.replaceAll(' Sqmm', '') : label),
    );
  }

  Widget productCard(int index, Map<String, dynamic> product) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: cardBackColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(vertical: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                product['image'],
                height: 200,
                width: double.infinity,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.grey.shade200,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.grey.shade200,
                    child: const Center(
                      child: Icon(Icons.error_outline, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '${product['brand']} ${product['weight']}',
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            decoration: BoxDecoration(
              color: themeColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "${product['quantity']} units Available",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 25),
          TextFormField(
            controller: quantityControllers[index],
            textAlign: TextAlign.left,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              labelText: 'Quantity',
              floatingLabelAlignment: FloatingLabelAlignment.start,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: "Enter quantity",
              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.blue),
              ),
            ),
            onChanged: (value) {
              int? newValue = int.tryParse(value);
              if (newValue != null && newValue > 0) {
                setState(() {
                  productSelected=true;
                  productQuantities[index] = newValue;
                });
              } else {
                setState(() {
                  productQuantities[index] = 1;
                  quantityControllers[index]!.text = "1";
                  quantityControllers[index]!.selection = TextSelection.fromPosition(
                    TextPosition(offset: quantityControllers[index]!.text.length),
                  );
                });
              }
            },
          ),
          const SizedBox(height: 5),
          // Row(
          //   children: [
          //     Checkbox(
          //       value: productSelections[index] ?? false, // Changed from productConfirmations
          //       activeColor: themeColor,
          //       onChanged: (bool? value) {
          //         setState(() {
          //           productSelections[index] = value ?? false; // Changed from productConfirmations
          //         });
          //       },
          //     ),
          //     Expanded(
          //       child: Text(
          //         "Select this product", // Changed from "Confirm order for this product"
          //         style: TextStyle(color: textColor, fontSize: 14),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.58,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Filter Products",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Brand",
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 10,
                            children: brands.map((brand) {
                              final isSelected = selectedBrands.contains(brand);
                              return FilterOption(
                                label: brand,
                                isSelected: isSelected,
                                onTap: () {
                                  setModalState(() {
                                    if (isSelected) {
                                      selectedBrands.remove(brand);
                                    } else {
                                      selectedBrands.add(brand);
                                    }
                                  });
                                },
                              );
                            }).toList(),
                          ),

                          const SizedBox(height: 20),

                          Text(
                            "Color",
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 10,
                            children: colors.map((color) {
                              final isSelected = selectedColors.contains(color);
                              return FilterOption(
                                label: color,
                                isSelected: isSelected,
                                onTap: () {
                                  setModalState(() {
                                    if (isSelected) {
                                      selectedColors.remove(color);
                                    } else {
                                      selectedColors.add(color);
                                    }
                                  });
                                },
                              );
                            }).toList(),
                          ),

                          const SizedBox(height: 20),

                          Text(
                            "Weight",
                            style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 10,
                            children: weights.map((length) {
                              final isSelected = selectedLengths.contains(length);
                              return FilterOption(
                                label: length,
                                isSelected: isSelected,
                                onTap: () {
                                  setModalState(() {
                                    if (isSelected) {
                                      selectedLengths.remove(length);
                                    } else {
                                      selectedLengths.add(length);
                                    }
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                            foregroundColor: textColor,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            setModalState(() {
                              selectedBrands.clear();
                              selectedColors.clear();
                              selectedLengths.clear();
                            });
                          },
                          child: const Text("Reset"),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: themeColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            applyFilters();
                            Navigator.pop(context);
                          },
                          child: const Text("Apply"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class FilterOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? themeColor : Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isSelected ? themeColor : Colors.grey.shade300,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}