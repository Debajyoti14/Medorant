import 'package:flutter/material.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen(args, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rewards',
          style: TextStyle(color: Color(0xFF706FE5), fontSize: 26),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
    // drawer: AppDrawer(),
  }
}
