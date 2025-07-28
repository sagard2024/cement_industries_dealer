import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cement_industries_dealer/app/constant/local_colors.dart';
import 'package:cement_industries_dealer/app/routes/app_pages.dart';

class DeliveryInformationScreen extends StatefulWidget {
  const DeliveryInformationScreen({super.key});

  @override
  State<DeliveryInformationScreen> createState() => _DeliveryInformationScreenState();
}

class _DeliveryInformationScreenState extends State<DeliveryInformationScreen> {
  String? selectedVehicleOption;
  String? selectedShipOption;

  List<Address> addresses = [
    Address(
      id: "1",
      fullAddress: "PHALODI BY PASS ROAD, VILLAGE MUNDERA, BEGUSARAI, BEGUSARAI, BEGUSARAI, Bihar, 851101",
      isSelected: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        scrolledUnderElevation: 0,
        title: Text(
            "Delivery Info",
            style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.w600)
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Vehicle',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Container(
              //   width: double.infinity,
              //   padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              //   decoration: BoxDecoration(
              //     color: const Color(0xFFE55E65),
              //     borderRadius: BorderRadius.circular(4),
              //   ),
              //   child: const Text(
              //     '*Please select any one from below',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 16,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),

              VehicleOptionTile(
                icon: Icons.directions_car,
                title: 'Own Vehicle',
                isSelected: selectedVehicleOption == 'own',
                onTap: () {
                  setState(() {
                    selectedVehicleOption = 'own';
                  });
                },
              ),

              VehicleOptionTile(
                icon: Icons.local_shipping,
                title: 'Transporter',
                isSelected: selectedVehicleOption == 'transporter',
                onTap: () {
                  setState(() {
                    selectedVehicleOption = 'transporter';
                  });
                },
              ),

              const SizedBox(height: 24),

              const Text(
                'Sold To',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 16),

              ...addresses.where((address) => address.isSelected).map((address) =>
                  AddressCard(
                    address: address,
                    onTap: () {
                    },
                  )
              ),

              const SizedBox(height: 24),

              const Text(
                'Ship To',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              // Container(
              //   width: double.infinity,
              //   padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              //   decoration: BoxDecoration(
              //     color: const Color(0xFFE55E65),
              //     borderRadius: BorderRadius.circular(4),
              //   ),
              //   child: const Text(
              //     '*Please select any one from below',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 16,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),

              ShipOptionTile(
                icon: Icons.person,
                title: 'SELF',
                isSelected: selectedShipOption == 'self',
                onTap: () {
                  setState(() {
                    selectedShipOption = 'self';
                  });
                },
              ),

              TextButton.icon(
                onPressed: () {
                  _showAddAddressDialog(context);
                },
                icon: const Icon(Icons.add, color: Colors.blue),
                label: const Text(
                  'Add Another Address',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.centerLeft,
                ),
              ),

              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: themeColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: themeColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if(selectedVehicleOption==null){
                          Get.snackbar(
                            'Vehicle Not Selected',
                            'Select any one vehicle method',
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM,
                            margin: const EdgeInsets.all(15),
                            duration: const Duration(seconds: 4),
                          );
                          return;
                        }

                        if(selectedShipOption==null){
                          Get.snackbar(
                            'Ship to Not Selected',
                            'Select ship to for placing the order',
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM,
                            margin: const EdgeInsets.all(15),
                            duration: const Duration(seconds: 4),
                          );
                          return;
                        }

                        Get.toNamed(Routes.REVIEW_ORDER_SCREEN);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: themeColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddAddressDialog(BuildContext context) {
    final addressLine1Controller = TextEditingController();
    final addressLine2Controller = TextEditingController();
    final cityController = TextEditingController();
    final stateController = TextEditingController();
    final pincodeController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Add New Address',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  TextField(
                    controller: addressLine1Controller,
                    decoration: const InputDecoration(
                      labelText: 'Address Line 1',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),

                  TextField(
                    controller: addressLine2Controller,
                    decoration: const InputDecoration(
                      labelText: 'Address Line 2',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: cityController,
                          decoration: const InputDecoration(
                            labelText: 'City',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          controller: stateController,
                          decoration: const InputDecoration(
                            labelText: 'State',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  TextField(
                    controller: pincodeController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Pincode',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        final fullAddress = [
                          addressLine1Controller.text,
                          addressLine2Controller.text,
                          cityController.text,
                          stateController.text,
                          "Bihar",
                          pincodeController.text,
                        ].where((s) => s.isNotEmpty).join(', ');

                        if (fullAddress.isNotEmpty) {
                          setState(() {
                            addresses.add(Address(
                              id: (addresses.length + 1).toString(),
                              fullAddress: fullAddress,
                              isSelected: false,
                            ));
                          });
                        }

                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: themeColor,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Save Address',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class VehicleOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const VehicleOptionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: cardBackColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, size: 28, color: Colors.black54),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.shade400,
              width: 2,
            ),
          ),
          child: isSelected
              ? Container(
            margin: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
          )
              : null,
        ),
        onTap: onTap,
      ),
    );
  }
}

class ShipOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const ShipOptionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: cardBackColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(color: blackColor.withAlpha(40), offset: const Offset(1.0, 1.0), blurRadius: 5, spreadRadius: 1.0),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, size: 28, color: Colors.black54),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.shade400,
              width: 2,
            ),
          ),
          child: isSelected
              ? Container(
            margin: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
          )
              : null,
        ),
        onTap: onTap,
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  final Address address;
  final VoidCallback onTap;

  const AddressCard({
    super.key,
    required this.address,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(4),
      ),
      child: ListTile(
        leading: const Icon(Icons.location_on_outlined, size: 28, color: Colors.grey),
        title: Text(
          address.fullAddress,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}

class Address {
  final String id;
  final String fullAddress;
  bool isSelected;

  Address({
    required this.id,
    required this.fullAddress,
    this.isSelected = false,
  });
}
