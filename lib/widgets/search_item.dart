// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SearchItem extends StatefulWidget {
  final String medicineName;
  final String price;

  const SearchItem({Key? key, required this.medicineName, required this.price})
      : super(key: key);

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  var _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            elevation: 1,
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: const Color.fromARGB(255, 112, 111, 229),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.medicineName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          widget.price,
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_isFavorite) {
                        _isFavorite = false;
                      } else {
                        _isFavorite = true;
                      }
                      setState(() {});
                    },
                    icon: Icon(
                        _isFavorite == true ? Icons.star : Icons.star_border),
                    color: const Color.fromARGB(255, 112, 111, 229),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
