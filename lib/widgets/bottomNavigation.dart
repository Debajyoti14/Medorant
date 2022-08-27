import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 2;
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(Icons.home, size: 30),
      const Icon(Icons.timelapse_outlined, size: 30),
      const Icon(Icons.search, size: 30),
      const Icon(Icons.money, size: 30),
      const Icon(Icons.person_off_outlined, size: 30),
    ];
    return Theme(
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
    );
  }
}
