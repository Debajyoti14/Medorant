import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen(String args, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Favourites',
            style: TextStyle(color: Colors.purple, fontSize: 26),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        // drawer: AppDrawer(),
      ),
    );
  }
}
