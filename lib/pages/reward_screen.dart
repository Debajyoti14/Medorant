import 'package:flutter/material.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen(args, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewards'),
      ),
      // drawer: AppDrawer(),
    );
  }
}
