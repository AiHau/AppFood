import 'package:app_food/config/color.dart';
import 'package:app_food/screens/home/home_screen.dart';
import 'package:app_food/screens/profile/my_profile.dart';
import 'package:app_food/screens/review_cart/review_cart.dart';
import 'package:flutter/material.dart';

class DrawerSide extends StatelessWidget {
  const DrawerSide({Key? key}) : super(key: key);

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
    return Drawer(
      child: Container(
        width: 100,
        color: primaryColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 43,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/premium-vector/cute-bakery-cake-logo_23-2148453860.jpg'),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Welcome Guest'),
                      const SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        height: 30,
                        child: MaterialButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                              width: 2,
                            ),
                          ),
                          child: const Text('Login'),
                        ),
                      ),
                    ],
                  ),
                ],
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
                  builder: (context) => const MyProfile(),
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
              onTap: () {},
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
