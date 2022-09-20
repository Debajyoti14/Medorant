import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:medorant/pages/login_screen.dart';
import 'package:http/http.dart' as http;

import '../api/google_signin_api.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;
  const ProfileScreen(this.userId, {Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var name = '';
  var email = '';
  var img1 =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png';
  var age = '';
  var diseases = [];
  var gender = '';
  getDetails(String id) async {
    var data = await http.get(Uri.parse(
        'https://8g34ra4qq2.execute-api.ap-south-1.amazonaws.com/dev/user/$id'));
    var details = jsonDecode(data.body.substring(1, data.body.length - 1));

    name = details['name'];
    email = details['email'];
    img1 = details['image'];
    age = details['age'].toString();
    diseases = details['disease'];
    gender = details['gender'];
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getDetails(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    getDetails(widget.userId);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Color(0xFF706FE5), fontSize: 26),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(img1),
                radius: 30,
              ),
              title: Text(
                name,
                style: const TextStyle(
                    color: Color.fromARGB(255, 112, 111, 229), fontSize: 18),
              ),
              // subtitle: Text(email),
              trailing: ElevatedButton(
                onPressed: () {},
                // color: const Color(0xFF706FE5),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF706FE5), // Background color
                ),
                child: const Text(
                  'Edit',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Details',
                    style: TextStyle(
                        color: Color.fromARGB(255, 112, 111, 229),
                        fontSize: 22),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          height: 70,
                          width: 60,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 215, 215, 236),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          child: Column(children: [
                            const Text(
                              'Age',
                              style: TextStyle(
                                color: Color.fromARGB(255, 112, 111, 229),
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              age,
                            ),
                          ]),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          height: 70,
                          width: 60,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 215, 215, 236),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          child: Column(children: [
                            const Text(
                              'Gender',
                              style: TextStyle(
                                color: Color.fromARGB(255, 112, 111, 229),
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              gender,
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 215, 215, 236),
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: Column(children: [
                        const Text(
                          'Disease',
                          style: TextStyle(
                            color: Color.fromARGB(255, 112, 111, 229),
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        for (var item in diseases) Text(item)
                      ]),
                    ),
                  ]),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        await GoogleSignInApi.logout();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Background color
                      ),
                      child: const Text(
                        'Log Out',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      child: const Text(
                        'Give us feedback',
                        style: TextStyle(
                            color: Color.fromARGB(255, 112, 111, 229)),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
