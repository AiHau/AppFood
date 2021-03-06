import 'package:app_food/config/components.dart';
import 'package:app_food/providers/product_provider.dart';
import 'package:app_food/providers/user_provider.dart';
import 'package:app_food/screens/home/drawer_side.dart';
import 'package:app_food/screens/home/singal_product.dart';
import 'package:app_food/screens/product_overview/product_overview.dart';
import 'package:app_food/screens/review_cart/review_cart.dart';
import 'package:app_food/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductProvider productProvider;
  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fatchFoodsProductData();
    productProvider.fatchDinkProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();
    return Scaffold(
      backgroundColor: background,
      drawer: DrawerSide(
        userProvider: userProvider,
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Home',
          style: TextStyle(color: textColor, fontSize: 17),
        ),
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundColor: primaryColor,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Search(
                          search: productProvider.getAllProductSearch,
                        )));
              },
              icon: Icon(
                Icons.search,
                size: 17,
                color: textColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 12,
                backgroundColor: const Color.fromARGB(255, 237, 195, 229),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 17,
                  color: textColor,
                ),
              ),
            ),
          )
        ],
        backgroundColor: const Color.fromARGB(255, 231, 164, 218),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.red,
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFqb1f0vLdMfWNNGrHO_mgiPDTMXRcKHLwWQ&usqp=CAU')),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 120, bottom: 10),
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 231, 164, 218),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              Strings.appTitle,
                              style: GoogleFonts.dancingScript(
                                  fontSize: 25,
                                  color: textSale,
                                  shadows: [
                                    const BoxShadow(
                                        color: Colors.green,
                                        blurRadius: 10,
                                        offset: Offset(3, 3))
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        Strings.numberSale,
                        style: TextStyle(
                            fontSize: 40,
                            color: numberSale,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          Strings.textSale,
                          style: TextStyle(color: textSale),
                        ),
                      )
                    ],
                  )),
                  Expanded(child: Container())
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(Strings.appTitle),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Search(
                            search: productProvider.getFoodProductDataList,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      Strings.textView,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: productProvider.getFoodProductDataList
                    .map((foodProductData) {
                  return SignalProducts(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductOverView(
                                productId: foodProductData.productId,
                                productPrice: foodProductData.productPrice,
                                productName: foodProductData.productName,
                                productImage: foodProductData.productImage,
                                productContent: foodProductData.productContent,
                              )));
                    },
                    productId: foodProductData.productId,
                    productPrice: foodProductData.productPrice,
                    productImage: foodProductData.productImage,
                    productName: foodProductData.productName,
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(Strings.textDrink),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Search(
                            search: productProvider.getDinkProductDataList,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'View all',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: productProvider.getDinkProductDataList
                    .map((dinkProductData) {
                  return SignalProducts(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductOverView(
                                productId: dinkProductData.productId,
                                productPrice: dinkProductData.productPrice,
                                productName: dinkProductData.productName,
                                productImage: dinkProductData.productImage,
                                productContent: dinkProductData.productContent,
                              )));
                    },
                    productId: dinkProductData.productId,
                    productPrice: dinkProductData.productPrice,
                    productImage: dinkProductData.productImage,
                    productName: dinkProductData.productName,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
