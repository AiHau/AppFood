import 'package:app_food/providers/user_provider.dart';
import 'package:app_food/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late UserProvider userProvider;
  Future<User?> _googleSignUp() async {
    try {
      // ignore: no_leading_underscores_for_local_identifiers
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      // ignore: no_leading_underscores_for_local_identifiers
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;

      // ignore: await_only_futures
      userProvider.addUserData(
          currentUser: user!,
          userName: user.displayName!,
          userImage: user.photoURL!,
          userEmail: user.email!);

      return user;
      // ignore: empty_catches
    } catch (e) {}
    return null;
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/background.jpg'),
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Sign in to continue'),
                Text(
                  'Food',
                  style: TextStyle(fontSize: 50, color: Colors.white, shadows: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.green.shade900,
                      offset: const Offset(3, 3),
                    )
                  ]),
                ),
                Column(
                  children: [
                    SignInButton(
                      Buttons.Apple,
                      text: "Sign up with Apple",
                      onPressed: () {},
                    ),
                    SignInButton(
                      Buttons.Google,
                      text: "Sign up with Google",
                      onPressed: () {
                        _googleSignUp().then(
                          (value) => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
