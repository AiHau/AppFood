import 'package:app_food/auth/sign_in.dart';
import 'package:app_food/config/color.dart';
import 'package:app_food/config/spacing.dart';
import 'package:app_food/providers/user_provider.dart';
import 'package:app_food/screens/check_out/delivery_details/delivery_details.dart';
import 'package:app_food/screens/home/drawer_side.dart';
import 'package:app_food/screens/my_order/my_order.dart';
import 'package:app_food/screens/profile/about_app.dart';
import 'package:app_food/screens/profile/privacy_policy.dart';
import 'package:app_food/screens/profile/terms_and_conditions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyProfile extends StatefulWidget {
  UserProvider userProvider;
  MyProfile({required this.userProvider, Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Widget listTile({required IconData icon, required String title}) {
    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.currentUserData;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: Text(
          "My Profile",
          style: TextStyle(
            fontSize: 18,
            color: textColor,
          ),
        ),
      ),
      drawer: DrawerSide(
        userProvider: widget.userProvider,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  color: primaryColor,
                ),
                Container(
                  height: 548,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 250,
                            height: 80,
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userData.userName,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: textColor),
                                    ),
                                    yHeight1,
                                    Text(userData.userEmail),
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: primaryColor,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: scaffoldBackgroundColor,
                                    child: Icon(
                                      Icons.edit,
                                      color: primaryColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CartHistory()));
                        },
                        child: listTile(
                            icon: Icons.shopping_bag_outlined,
                            title: "My Orders"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const DeliveryDetails()));
                        },
                        child: listTile(
                            icon: Icons.location_on_outlined,
                            title: "My Delivery Address"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const TermsAndConditions()));
                        },
                        child: listTile(
                            icon: Icons.file_copy_outlined,
                            title: "Terms & Conditions"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const PrivacyPolicy()));
                        },
                        child: listTile(
                            icon: Icons.policy_outlined,
                            title: "Privacy Policy"),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const AboutApp()));
                          },
                          child:
                              listTile(icon: Icons.add_chart, title: "About")),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignIn()));
                        },
                        child: listTile(
                            icon: Icons.exit_to_app_outlined, title: "Log Out"),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 30),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: primaryColor,
                child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      userData.userImage ??
                          "https://img.freepik.com/premium-vector/cute-bakery-cake-logo_23-2148453860.jpg",
                    ),
                    radius: 45,
                    backgroundColor: scaffoldBackgroundColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
