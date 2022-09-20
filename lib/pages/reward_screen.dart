import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/images/rewards.svg',
              height: 330,
              width: 150,
            ),
          )
        ],
      ),
    );
    // drawer: AppDrawer(),
  }
}
