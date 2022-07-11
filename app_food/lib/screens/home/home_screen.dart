import 'package:app_food/config/color.dart';
import 'package:app_food/screens/home/drawer_side.dart';
import 'package:app_food/screens/home/singal_product.dart';
import 'package:app_food/screens/product_overview/product_overview.dart';
import 'package:app_food/screens/search/search.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffcbcbcb),
      drawer: const DrawerSide(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundColor: primaryColor,
            
            child: IconButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Search()));
              },
              icon: const Icon(
                Icons.search,
                size: 17,
                color: Colors.black,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Color.fromARGB(255, 237, 195, 229),
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 17,
                color: Colors.black,
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
                          child: const Center(
                            child: Text(
                              'Food',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  shadows: [
                                    BoxShadow(
                                        color: Colors.green,
                                        blurRadius: 10,
                                        offset: Offset(3, 3))
                                  ]),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '30% Off',
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.green[100],
                            fontWeight: FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'On all vegetable products',
                          style: TextStyle(color: Colors.white),
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
                children: const [
                  Text('Herbs Seasonings'),
                  Text(
                    'View all',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SignalProducts(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ProductOverView(
                                productName: "Hamburger",
                                productImage:
                                    "https://pngimg.com/uploads/burger_sandwich/burger_sandwich_PNG96770.png",
                              )));
                    },
                    productImage:
                        'https://pngimg.com/uploads/burger_sandwich/burger_sandwich_PNG96770.png',
                    productName: 'Hamburger',
                  ),
                  SignalProducts(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ProductOverView(
                                productName: "Fried Chicken",
                                productImage:
                                    "https://pngimg.com/uploads/turkey_food/turkey_food_PNG14.png",
                              )));
                    },
                    productImage:
                        'https://pngimg.com/uploads/turkey_food/turkey_food_PNG14.png',
                    productName: 'Fried Chicken',
                  ),
                  SignalProducts(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ProductOverView(
                                productName: "Noodle Soup",
                                productImage:
                                    "https://pngimg.com/uploads/noodle/noodle_PNG70.png",
                              )));
                    },
                    productImage:
                        'https://pngimg.com/uploads/noodle/noodle_PNG70.png',
                    productName: 'Noodle Soup',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Dink'),
                  Text(
                    'View all',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SignalProducts(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ProductOverView(
                                productName: "Cocktail",
                                productImage:
                                    "https://pngroyale.com/wp-content/uploads/2022/02/Cocktail-Ice-Drink-PNG-Image-1.png",
                              )));
                    },
                    productImage:
                        'https://pngroyale.com/wp-content/uploads/2022/02/Cocktail-Ice-Drink-PNG-Image-1.png',
                    productName: 'Cocktail',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListContent extends StatelessWidget {
  const ListContent({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black45),
      ),
    );
  }
}