import 'package:app_food/config/color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SingleItem extends StatelessWidget {
  SingleItem(
      {required this.isBool,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      this.productId,
      this.productQuantity,
      this.onDelete,
      Key? key})
      : super(key: key);

  bool isBool = false;
  String productImage;
  String productName;
  int productPrice;
  String? productId;
  int? productQuantity;
  Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    child: Center(
                      child: Image.network(productImage),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName,
                            style: TextStyle(
                                color: textColor, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$productPrice\$',
                            style: TextStyle(
                                color: textColor, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      isBool == false
                          ? Container(
                              margin: const EdgeInsets.only(right: 15),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(children: [
                                const Expanded(
                                  child: Text(
                                    '50 Gram',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    size: 20,
                                    color: primaryColor,
                                  ),
                                )
                              ]),
                            )
                          : const Text('50 Gram')
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 90,
                  padding: isBool == false
                      ? const EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : const EdgeInsets.only(left: 15, right: 15),
                  child: isBool == false
                      ? Container(
                          height: 25,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: secondColor,
                                  size: 20,
                                ),
                                Text(
                                  'ADD',
                                  style: TextStyle(
                                    color: secondColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: onDelete,
                                child: const Icon(
                                  Icons.delete,
                                  size: 30,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 25,
                                width: 70,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.remove,
                                        color: secondColor,
                                        size: 20,
                                      ),
                                      Text(
                                        '1',
                                        style: TextStyle(
                                          color: secondColor,
                                        ),
                                      ),
                                      Icon(
                                        Icons.add,
                                        color: secondColor,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        isBool == false
            ? Container()
            : const Divider(
                height: 1,
                color: Colors.black45,
              )
      ],
    );
  }
}
