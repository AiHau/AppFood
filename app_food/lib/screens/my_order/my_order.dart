// ignore_for_file: library_private_types_in_public_api

import 'package:app_food/config/color.dart';
import 'package:app_food/models/delivery_address_model.dart';
import 'package:app_food/providers/check_out_provider.dart';
import 'package:app_food/providers/review_cart_provider.dart';
import 'package:app_food/screens/check_out/delivery_details/single_delivery_item.dart';
import 'package:app_food/screens/check_out/payment_summary/order_item.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CartHistory extends StatefulWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  _CartHistoryState createState() => _CartHistoryState();
}

class _CartHistoryState extends State<CartHistory> {
  late DeliveryAddressModel value;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData();
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    double discount = 30;
    double discountValue = 0;
    double shipping = 15;
    double total = 0;
    double totalPrice = reviewCartProvider.getTotalPrice();
    if (totalPrice > 100) {
      discountValue = (totalPrice * discount) / 100;
      total = totalPrice - discountValue;
    }
    total = totalPrice;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: textColor,
        title: const Text("Cart History"),
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text("My order"),
          ),
          const Divider(
            height: 1,
          ),
          deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? const Center(
                  child: Center(
                    child: Text("No Data"),
                  ),
                )
              : Column(
                  children: [
                    Column(
                      children: deliveryAddressProvider.getDeliveryAddressList
                          .map<Widget>((e) {
                        setState(() {
                          value = e;
                        });
                        return SingleDeliveryItem(
                          address:
                              "${e.street} street, ${e.province}, ${e.scoiety}",
                          title: "${e.firstName} ${e.lastName}",
                          number: e.mobileNo,
                          addressType: e.addressType == "AddressTypes.Home"
                              ? "Home"
                              : e.addressType == "AddressTypes.Other"
                                  ? "Other"
                                  : "Work",
                        );
                      }).toList(),
                    ),
                    ExpansionTile(
                      title: Text(
                          "Order Items ${reviewCartProvider.getReviewCartDataList.length}"),
                      children:
                          reviewCartProvider.getReviewCartDataList.map((e) {
                        return OrderItem(
                          e: e,
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total Order"),
                          Text(
                            "\$${total + shipping - discountValue}",
                            style: TextStyle(
                              color: Colors.green[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
        ],
      ),
    );
  }
}
