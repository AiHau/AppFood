// ignore_for_file: constant_identifier_names, library_private_types_in_public_api, unused_local_variable

import 'package:app_food/config/color.dart';
import 'package:app_food/models/delivery_address_model.dart';
import 'package:app_food/models/review_cart_model.dart';
import 'package:app_food/providers/check_out_provider.dart';
import 'package:app_food/providers/review_cart_provider.dart';
import 'package:app_food/screens/check_out/delivery_details/single_delivery_item.dart';
import 'package:app_food/screens/check_out/payment_summary/order_item.dart';
import 'package:app_food/screens/my_order/my_order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentSummary extends StatefulWidget {
  final DeliveryAddressModel deliverAddressList;
  const PaymentSummary({Key? key, required this.deliverAddressList})
      : super(key: key);

  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}

enum AddressTypes {
  Home,
  OnlinePayment,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressTypes.Home;
  List<ReviewCartModel> oderItemList = [];

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    CheckoutProvider checkoutProvider = Provider.of(context);

    double discount = 30;
    double discountValue = 0;
    double shipping = 15;
    double total;
    double totalPrice = reviewCartProvider.getTotalPrice();
    double subTotal = reviewCartProvider.getTotalOrder();
    if (totalPrice > 100) {
      discountValue = (totalPrice * discount) / 100;
      total = totalPrice - discountValue;
    }
    total = totalPrice;
    int index;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: textColor,
        backgroundColor: primaryColor,
        title: const Text(
          "Payment Summary",
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: ListTile(
        title: const Text("Total Amount"),
        subtitle: Text(
          "\$$subTotal",
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        trailing: SizedBox(
          width: 160,
          child: BuildButton(
            reviewCartProvider: reviewCartProvider,
            subTotal: subTotal,
            oderItemList: oderItemList,
            checkoutProvider: checkoutProvider,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SingleDeliveryItem(
                  address:
                      " ${widget.deliverAddressList.street} street, ${widget.deliverAddressList.province}, ${widget.deliverAddressList.scoiety}",
                  title:
                      "${widget.deliverAddressList.firstName} ${widget.deliverAddressList.lastName}",
                  number: widget.deliverAddressList.mobileNo,
                  addressType: widget.deliverAddressList.addressType ==
                          "AddressTypes.Home"
                      ? "Home"
                      : widget.deliverAddressList.addressType ==
                              "AddressTypes.Other"
                          ? "Other"
                          : "Work",
                ),
                const Divider(),
                ExpansionTile(
                  title: Text(
                      "Order Items ${reviewCartProvider.getReviewCartDataList.length}"),
                  children: reviewCartProvider.getReviewCartDataList.map((e) {
                    return OrderItem(
                      e: e,
                    );
                  }).toList(),
                ),
                const Divider(),
                ListTile(
                  minVerticalPadding: 5,
                  leading: const Text(
                    "Sub Total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    "\$$totalPrice",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Shipping Charge",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: Text(
                    "\$$shipping",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Discount",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: Text(
                    "-\$$discountValue",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(),
                const ListTile(
                  leading: Text("Payment Options"),
                ),
                RadioListTile(
                  value: AddressTypes.Home,
                  groupValue: myType,
                  title: const Text("Home"),
                  onChanged: (AddressTypes? value) {
                    setState(() {
                      myType = value!;
                    });
                  },
                  secondary: Icon(
                    Icons.work,
                    color: primaryColor,
                  ),
                ),
                RadioListTile(
                  value: AddressTypes.OnlinePayment,
                  groupValue: myType,
                  title: const Text("OnlinePayment"),
                  onChanged: (AddressTypes? value) {
                    setState(() {
                      myType = value!;
                    });
                  },
                  secondary: Icon(
                    Icons.devices_other,
                    color: primaryColor,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class BuildButton extends StatelessWidget {
  const BuildButton({
    Key? key,
    required this.reviewCartProvider,
    required this.subTotal,
    required this.oderItemList,
    required this.checkoutProvider,
  }) : super(key: key);

  final ReviewCartProvider reviewCartProvider;
  final CheckoutProvider checkoutProvider;
  final double subTotal;
  final List<ReviewCartModel> oderItemList;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const CartHistory()));
        FirebaseFirestore.instance
            .collection("Order")
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .collection("MyOrders")
            .doc()
            .set({
          "subTotal": subTotal,
          "orderItems": reviewCartProvider.getReviewCartDataList
              .map((e) => {
                    "orderTime": DateTime.now(),
                    "orderImage": e.cartImage,
                    "orderName": e.cartName,
                    "orderPrice": e.cartPrice,
                    "orderQuantity": e.cartQuantity
                  })
              .toList(),
          "address": checkoutProvider.deliveryAdressList
              .map((e) => {
                    "country": e.scoiety,
                    "street": e.street,
                    "city": e.city,
                    "province": e.province,
                  })
              .toList(),
        });
      },
      color: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        "Place Order",
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
