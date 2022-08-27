import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:medorant/pages/text_scan.dart';

import '../utils/themes.dart';

class MainHome extends StatefulWidget {
  final String args;
  const MainHome(this.args, {Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  var name = '';
  var email = '';
  var img1 =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png';
  @override
  Widget build(BuildContext context) {
    getDetails(String id) async {
      var data = await http.get(Uri.parse(
          'https://8g34ra4qq2.execute-api.ap-south-1.amazonaws.com/dev/user/$id'));
      var details = jsonDecode(data.body.substring(1, data.body.length - 1));

      name = details['name'];
      email = details['email'];
      img1 = details['image'];
      // print(details['img']);
      setState(() {});
    }

    getDetails(widget.args);
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(img1),
            radius: 30,
          ),
          title: Text(
            'Welcome Back 👋',
            style: TextStyle(
              color: AppTheme.lightTheme(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Text(name),
          trailing: const Text('224'),
        ),
        const SizedBox(
          height: 70,
        ),
        const Text(
          'Welcome to',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Medorant',
          style: TextStyle(
            fontSize: 55,
            fontWeight: FontWeight.bold,
            color: AppTheme.lightTheme(context).primaryColor,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(30),
          child: Text(
            'A simple yet powerful mobile app that tells you which \n Medicine is counterfeit for you.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Color.fromARGB(255, 120, 120, 120),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          child: Image.asset('assets/images/Search.png'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const Scan(),
                  settings: RouteSettings(arguments: widget.args)),
            );
          },
        )
      ],
    ));
  }
}
