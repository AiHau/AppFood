import 'package:app_food/config/color.dart';
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
                    const SizedBox(
                      width: 20,
                    ),
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
              iconData: Icons.notifications_outlined,
              title: 'Notification',
              onTap: () {},
            ),
            listContent(
              iconData: Icons.star_outline,
              title: 'Rating & Review',
              onTap: () {},
            ),
            listContent(
              iconData: Icons.favorite_outline_sharp,
              title: 'Wishist',
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const WishLsit()));
              },
            ),
            listContent(
              iconData: Icons.copy_outlined,
              title: 'Raise a Complaint',
              onTap: () {},
            ),
            listContent(
              iconData: Icons.format_quote_outlined,
              title: 'FAQs',
              onTap: () {},
            ),
            Container(
              height: 350,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Contact Support'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Text('Call us:'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('+9248593898'),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        Text('Mail us:'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
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
