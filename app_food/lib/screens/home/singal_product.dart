// ignore_for_file: prefer_typing_uninitialized_variables, prefer_if_null_operators

import 'package:app_food/config/color.dart';
import 'package:app_food/config/spacing.dart';
import 'package:app_food/widgets/count.dart';
import 'package:flutter/material.dart';

class SignalProducts extends StatefulWidget {
  const SignalProducts({
    Key? key,
    required this.productImage,
    required this.productName,
    required this.onTap,
    required this.productPrice,
    required this.productId,
  }) : super(key: key);
  final String productId;
  final String productImage;
  final String productName;
  final int productPrice;
  final Function() onTap;

  @override
  State<SignalProducts> createState() => _SignalProductsState();
}

class _SignalProductsState extends State<SignalProducts> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            height: 230,
            width: 165,
            decoration: BoxDecoration(
              color: const Color(0xffd9dad9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    height: 150,
                    padding: const EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(widget.productImage),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.productName,
                            style: TextStyle(
                                color: textColor, fontWeight: FontWeight.bold),
                          ),
                          yHeight05,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${widget.productPrice}\$',
                                style: const TextStyle(color: Colors.grey),
                              ),
                              Count(
                                productId: widget.productId,
                                productImage: widget.productImage,
                                productName: widget.productName,
                                productPrice: widget.productPrice,
                              ),
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
