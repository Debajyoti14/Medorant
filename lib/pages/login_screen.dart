import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medorant/pages/navigation.dart';
import 'package:medorant/utils/themes.dart';
import '../api/google_signin_api.dart';
import 'login_personal_data.dart';
import 'dart:convert';

import 'main_home.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/welcome-screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var _isLoggedIn = false;

    // ignore: non_constant_identifier_names
    Future SignIn() async {
      final user = await GoogleSignInApi.login();

      sendData(String id) async {
        try {
          final response = await http.get(Uri.parse(
              'https://8g34ra4qq2.execute-api.ap-south-1.amazonaws.com/dev/user/$id'));
          final getResponse = json.decode(response.body);
          if (getResponse.length == 0) {
            await http.post(
              Uri.parse(
                  'https://8g34ra4qq2.execute-api.ap-south-1.amazonaws.com/dev/user'),
              headers: <String, String>{
                'Content-Type': 'application/json',
              },
              body: jsonEncode({
                "user_id": user!.id.toString(),
                "favourites": [],
                "disease": [],
                "recent_searches": [],
                "searches": 0,
                "gender": '',
                "age": null,
                "name": user.displayName.toString(),
                "email": user.email,
                "image": user.photoUrl.toString()
              }),
            );
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const LoginEdit(),
              ),
            );
          } else {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => MainHome(user!.id),
                settings: RouteSettings(arguments: [
                  user?.id,
                  user?.photoUrl,
                  user?.displayName,
                  user?.email
                ]),
              ),
            );
          }
        } catch (e) {
          print(e);
        }
      }

      //getData

      if (user == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Sign In Failed")));
      } else {
        _isLoggedIn = true;
      }

      if (_isLoggedIn == true) {
        print(user!.id);
        sendData(user.id);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginEdit(),
            settings: RouteSettings(arguments: user.id),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login bg.png'),
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100, bottom: 50),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Welcome',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 112, 111, 229)),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        const Text(
                          'Medorant',
                          style: TextStyle(
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 15, 15, 15)),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                const Expanded(child: SizedBox(height: 60)),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: double.infinity,
                        padding:
                            const EdgeInsets.only(top: 25, left: 24, right: 24),
                        child: ElevatedButton(
                          onPressed: SignIn,
                          style: ElevatedButton.styleFrom(
                              primary:
                                  AppTheme.lightTheme(context).primaryColor),
                          child: const Text(
                            'Login with Google',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
