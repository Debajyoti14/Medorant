import 'package:flutter/material.dart';
import 'package:medorant/pages/login_screen.dart';

import '../api/google_signin_api.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen(String userId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/img1.jpg'),
                radius: 30,
              ),
              title: const Text(
                'Roshan Kumar',
                style: TextStyle(
                    color: Color.fromARGB(255, 112, 111, 229), fontSize: 18),
              ),
              subtitle: const Text('Roshan'),
              trailing: RaisedButton(
                onPressed: () {},
                color: const Color.fromARGB(255, 112, 111, 229),
                child: const Text(
                  'Edit',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
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
                          child: Column(children: const [
                            Text(
                              'Age',
                            ),
                            Text(
                              '21',
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
                          child: Column(children: const [
                            Text(
                              'Age',
                            ),
                            Text(
                              '21',
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
                      child: Column(children: const [
                        Text(
                          'Disease',
                        ),
                        Text(
                          'Diabetes',
                        ),
                        Text(
                          'Diabetes',
                        ),
                        Text(
                          'Diabetes',
                        ),
                      ]),
                    ),
                  ]),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 215, 215, 236),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        child: Column(children: const [
                          Text(
                            'Disease',
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'Diabetes',
                          ),
                          Text(
                            'Diabetes',
                          ),
                          Text(
                            'Diabetes',
                          ),
                        ]),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () async {
                        await GoogleSignInApi.logout();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                      },
                      elevation: 0,
                      color: Colors.red,
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
                    child: FlatButton(
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
