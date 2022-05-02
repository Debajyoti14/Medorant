import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  var low;
  var mid;
  var high;
  var safeCheck;
  Counter(this.high, this.mid, this.low, this.safeCheck, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: safeCheck
            ? const Color.fromARGB(100, 223, 245, 232)
            : const Color.fromARGB(100, 245, 223, 223),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            safeCheck ? 'SAFE' : 'NOT SAFE',
            style: TextStyle(
                color: safeCheck
                    ? const Color.fromARGB(100, 0, 206, 45)
                    : const Color.fromARGB(100, 206, 0, 0),
                fontSize: 22),
          ),
          const SizedBox(
            height: 25,
          ),
          safeCheck
              ? const Text(
                  "Totally Safe For you",
                  style: TextStyle(
                      color: Color.fromARGB(100, 0, 206, 45), fontSize: 18),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 25,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '$high high',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 25,
                            color: Colors.yellow,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '$mid medium',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 25,
                            color: Colors.green,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '$low low',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
