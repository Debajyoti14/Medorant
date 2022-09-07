import 'package:flutter/material.dart';

class Tags extends StatelessWidget {
  final String data;
  const Tags(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(data),
      padding: const EdgeInsets.all(7),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 226, 226, 226),
          borderRadius: BorderRadius.circular(4)),
    );
  }
}
