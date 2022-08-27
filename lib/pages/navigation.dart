import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:medorant/pages/profile_screen.dart';
import 'package:medorant/pages/reward_screen.dart';
import 'package:medorant/pages/search_screen.dart';
import 'package:medorant/utils/themes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'favourite_screen.dart';
import 'main_home.dart';

class Navigation extends StatefulWidget {
  final String args;

  const Navigation(
    this.args, {
    Key? key,
  }) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 2;
  var name = '';
  var email = '';
  var img1 =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png';

  var userId = '';

  @override
  Widget build(BuildContext context) {
    final screens = [
      RewardScreen(widget.args),
      SearchScreen(widget.args),
      MainHome(widget.args),
      FavouriteScreen(widget.args),
      ProfileScreen(widget.args),
    ];
    final items = <Widget>[
      const Icon(Icons.wallet_giftcard, size: 30),
      const Icon(Icons.timelapse_outlined, size: 30),
      const Icon(Icons.home, size: 30),
      const Icon(Icons.favorite, size: 30),
      const Icon(Icons.person, size: 30),
    ];
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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(context),
      home: Scaffold(
        body: screens[index],
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
          child: CurvedNavigationBar(
            key: navigationKey,
            height: 60,
            index: index,
            items: items,
            onTap: (index) => setState(() => this.index = index),
            color: const Color.fromARGB(255, 112, 111, 229),
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeIn,
            animationDuration: const Duration(milliseconds: 100),
          ),
        ),
      ),
    );
  }
}
