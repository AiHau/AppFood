import 'package:app_food/config/color.dart';
import 'package:flutter/material.dart';

enum SinginCharacter { fill, outline }

class ProductOverView extends StatefulWidget {
  final String? productName;
  final String? productImage;
  final int? productPrice;
  final String? productId;

  const ProductOverView(
      {Key? key,
      this.productName,
      this.productImage,
      this.productPrice,
      this.productId})
      : super(key: key);

  @override
  State<ProductOverView> createState() => _ProductOverViewState();
}

class _ProductOverViewState extends State<ProductOverView> {
  SinginCharacter _character = SinginCharacter.fill;
  Widget bonntonNavigatorBar({
    required Color iconColor,
    required Color backgroundColor,
    required Color color,
    required String title,
    required IconData iconData,
    //required Function() onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        //onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 20,
                color: iconColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bonntonNavigatorBar(
            backgroundColor: textColor,
            color: Colors.white70,
            iconColor: Colors.grey,
            title: "Add To WishList",
            iconData: Icons.favorite_outline,
          ),
          bonntonNavigatorBar(
            backgroundColor: primaryColor,
            color: textColor,
            iconColor: Colors.white70,
            title: "Go To Cart",
            iconData: Icons.shop_outlined,
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Product Overview',
          style: TextStyle(color: textColor),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                ListTile(
                  title: Text(widget.productName!),
                  subtitle: const Text("\$50"),
                ),
                Container(
                  height: 250,
                  padding: const EdgeInsets.all(40),
                  child: Image.network(widget.productImage!),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: Text(
                    "Available Options",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: Colors.green[700],
                          ),
                          Radio(
                              value: SinginCharacter.fill,
                              groupValue: _character,
                              activeColor: Colors.green[700],
                              onChanged: (value) {
                                setState(() {
                                  _character = value as SinginCharacter;
                                });
                              }),
                        ],
                      ),
                      const Text("\$50"),
                      // Count(
                      //   productId: widget.productId,
                      //   productImage: widget.productImage,
                      //   productName: widget.productName,
                      //   productPrice: widget.productPrice,
                      //   productUnit: '500 Gram',
                      // ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.add,
                              size: 15,
                              color: Color(0xffd0b84c),
                            ),
                            Text(
                              "ADD",
                              style: TextStyle(color: Color(0xffd0b84c)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "About This Product",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "of a customer. Wikipedi In marketing, a product is an object or system made available for consumer use; it is anything that can be offered to a market to satisfy the desire or need of a customer. Wikipedi",
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// import 'dart:ui';


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';


// enum SinginCharacter { fill, outline }

// class ProductOverview extends StatefulWidget {
//   final String productName;
//   final String productImage;
//   final int productPrice;
//   final String productId;
//   ProductOverview(
//       {required this.productId, required this.productImage, required this.productName, required this.productPrice});

//   @override
//   _ProductOverviewState createState() => _ProductOverviewState();
// }

// class _ProductOverviewState extends State<ProductOverview> {
//   SinginCharacter _character = SinginCharacter.fill;

//   Widget bonntonNavigatorBar({
//     required Color iconColor,
//     required Color backgroundColor,
//     required Color color,
//     required String title,
//     required IconData iconData,
//     required Function() onTap,
//   }) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           padding: EdgeInsets.all(20),
//           color: backgroundColor,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 iconData,
//                 size: 20,
//                 color: iconColor,
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 title,
//                 style: TextStyle(color: color),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   bool wishListBool = false;

//   getWishtListBool() {
//     FirebaseFirestore.instance
//         .collection("WishList")
//         .doc(FirebaseAuth.instance.currentUser.uid)
//         .collection("YourWishList")
//         .doc(widget.productId)
//         .get()
//         .then((value) => {
//               if (this.mounted)
//                 {
//                   if (value.exists)
//                     {
//                       setState(
//                         () {
//                           wishListBool = value.get("wishList");
//                         },
//                       ),
//                     }
//                 }
//             });
//   }

//   @override
//   Widget build(BuildContext context) {
//     WishListProvider wishListProvider = Provider.of(context);
//     getWishtListBool();
//     return Scaffold(
//       bottomNavigationBar: Row(
//         children: [
//           bonntonNavigatorBar(
//               backgroundColor: textColor,
//               color: Colors.white70,
//               iconColor: Colors.grey,
//               title: "Add To WishList",
//               iconData: wishListBool == false
//                   ? Icons.favorite_outline
//                   : Icons.favorite,
//               onTap: () {
//                 setState(() {
//                   wishListBool = !wishListBool;
//                 });
//                 if (wishListBool == true) {
//                   wishListProvider.addWishListData(
//                     wishListId: widget.productId,
//                     wishListImage: widget.productImage,
//                     wishListName: widget.productName,
//                     wishListPrice: widget.productPrice,
//                     wishListQuantity: 2,
                    
//                   );
//                 } else {
//                   wishListProvider.deleteWishtList(widget.productId);
//                 }
//               }),
//           bonntonNavigatorBar(
//               backgroundColor: primaryColor,
//               color: textColor,
//               iconColor: Colors.white70,
//               title: "Go To Cart",
//               iconData: Icons.shop_outlined,
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => ReviewCart(),
//                   ),
//                 );
//               }),
//         ],
//       ),
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: textColor),
//         title: Text(
//           "Product Overview",
//           style: TextStyle(color: textColor),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 2,
//             child: Container(
//               width: double.infinity,
//               child: Column(
//                 children: [
//                   ListTile(
//                     title: Text(widget.productName),
//                     subtitle: Text("\$50"),
//                   ),
//                   Container(
//                       height: 250,
//                       padding: EdgeInsets.all(40),
//                       child: Image.network(
//                         widget.productImage ?? "",
//                       )),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     width: double.infinity,
//                     child: Text(
//                       "Available Options",
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                         color: textColor,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 10,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             CircleAvatar(
//                               radius: 3,
//                               backgroundColor: Colors.green[700],
//                             ),
//                             Radio(
//                               value: SinginCharacter.fill,
//                               groupValue: _character,
//                               activeColor: Colors.green[700],
//                               onChanged: (value) {
//                                 setState(() {
//                                   _character = value;
//                                 });
//                               },
//                             ),
//                           ],
//                         ),
//                         Text("\$${widget.productPrice}"),
//                         Count(
//                           productId: widget.productId,
//                           productImage: widget.productImage,
//                           productName: widget.productName,
//                           productPrice: widget.productPrice,
//                           productUnit: '500 Gram',
//                         ),
//                         // Container(
//                         //   padding: EdgeInsets.symmetric(
//                         //     horizontal: 30,
//                         //     vertical: 10,
//                         //   ),
//                         //   decoration: BoxDecoration(
//                         //     border: Border.all(
//                         //       color: Colors.grey,
//                         //     ),
//                         //     borderRadius: BorderRadius.circular(
//                         //       30,
//                         //     ),
//                         //   ),
//                         //   child: Row(
//                         //     mainAxisAlignment: MainAxisAlignment.center,
//                         //     children: [
//                         //       Icon(
//                         //         Icons.add,
//                         //         size: 17,
//                         //         color: primaryColor,
//                         //       ),
//                         //       Text(
//                         //         "ADD",
//                         //         style: TextStyle(color: primaryColor),
//                         //       )
//                         //     ],
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.all(20),
//               width: double.infinity,
//               child: ListView(
//                 children: [
//                   Text(
//                     "About This Product",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     "of a customer. Wikipedi In marketing, a product is an object or system made available for consumer use; it is anything that can be offered to a market to satisfy the desire or need of a customer. Wikipedi",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: textColor,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }