import 'package:app_food/config/color.dart';
import 'package:app_food/config/spacing.dart';
import 'package:app_food/providers/user_provider.dart';
import 'package:app_food/screens/home/home_screen.dart';
import 'package:app_food/screens/profile/my_profile.dart';
import 'package:app_food/screens/review_cart/review_cart.dart';
import 'package:app_food/screens/wishList/wish_list.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerSide extends StatefulWidget {
  UserProvider userProvider;
  DrawerSide({Key? key, required this.userProvider}) : super(key: key);

  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  Widget listContent(
      {required String title,
      required IconData iconData,
      required Function() onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        iconData,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.currentUserData;
    return Drawer(
      child: Container(
        width: 100,
        color: primaryColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white54,
                      radius: 43,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(userData.userImage ??
                            'https://img.freepik.com/premium-vector/cute-bakery-cake-logo_23-2148453860.jpg'),
                      ),
                    ),
                    xWidth2,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(userData.userName),
                        Text(
                          userData.userEmail,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            listContent(
              iconData: Icons.home_outlined,
              title: 'Home',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
            ),
            listContent(
              iconData: Icons.shopping_bag_outlined,
              title: 'Review Cart',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ReviewCart(),
                ));
              },
            ),
            listContent(
              iconData: Icons.person_outlined,
              title: 'My Profile',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MyProfile(
                    userProvider: widget.userProvider,
                  ),
                ));
              },
            ),
            listContent(
              iconData: Icons.favorite_outline_sharp,
              title: 'Wishist',
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const WishLsit()));
              },
            ),
            yHeight10,
            Container(
              height: 350,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Contact Support'),
                  yHeight1,
                  const Divider(),
                  yHeight1,
                  Row(
                    children: [
                      const Text('Call us:'),
                      xWidth1,
                      const Text('+9248593898'),
                    ],
                  ),
                  yHeight1,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const Text('Mail us:'),
                        xWidth1,
                        const Text(
                          'support@gmail.com',
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
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
