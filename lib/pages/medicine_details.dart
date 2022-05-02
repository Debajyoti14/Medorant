import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medorant/widgets/counterfeit.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class MedicineDetails extends StatefulWidget {
  const MedicineDetails({Key? key}) : super(key: key);

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {
  var medName = '';
  var mrp = '';
  var store = [];
  var use = '';
  var howToUse = '';
  var sideEffects = [];
  var counterfeit = true;
  var problem = {};
  var altMed = [];
  var mid = '';
  var high = '';
  var low = '';
  var prep = '';

  getDetails(String id, String name) async {
    var finalName = name.trim();
    var data = await http.get(
      Uri.parse(
          'https://8g34ra4qq2.execute-api.ap-south-1.amazonaws.com/dev/med/$finalName?user_id=$id'),
    );

    var finalData = jsonDecode(data.body);
    medName = finalData['medicine_name'];
    mrp = finalData['mrp'] as String;
    store = finalData['best_buy'];
    use = finalData['uses'][0];
    howToUse = finalData['how_to_use'];
    sideEffects = finalData['side_effects'];
    counterfeit = finalData['counterFeit'];
    problem = finalData['severity'];
    altMed = finalData['alternative_medicines'];
    prep = finalData['prescription'];
    print(mrp);

    if (problem['mediumSeverity']['count'].toString() == "null") {
      mid = "0";
    } else {
      mid = problem['mediumSeverity']['count'].toString();
    }
    if (problem['highSeverity']['count'].toString() == "null") {
      high = "0";
    } else {
      high = problem['highSeverity']['count'].toString();
    }
    if (problem['lowSeverity']['count'].toString() == "null") {
      low = "0";
    } else {
      low = problem['lowSeverity']['count'].toString();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as List;
    print(data[1]);
    print(data[0]);
    getDetails(data[1], data[0]);

    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                    height: 200, child: Image.asset('assets/images/med.png')),
              ),
              const SizedBox(height: 25),
              Text(
                medName.toUpperCase(),
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              Column(children: [
                Counter(
                  high,
                  mid,
                  low,
                  counterfeit,
                ),
              ]),
              const SizedBox(height: 30),
              //price

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'PRICE',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(mrp, style: const TextStyle(fontSize: 18)),
                ],
              ),

              // next
              const SizedBox(height: 35),
              //USE
              const Text(
                'HOW TO USE :',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    howToUse,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(31, 128, 128, 128)),
              ),

              //END USE
              const SizedBox(height: 35),
              const Text(
                'USES :',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),

              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    use,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(31, 128, 128, 128)),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'SIDE EFFECTS :',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: sideEffects
                            .map((e) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    '◉  $e',
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(31, 128, 128, 128)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'STORES :',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: store
                            .map((e) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: InkWell(
                                    child: Text(
                                      "◉  ${e['store']}",
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    onTap: () {
                                      launch(e['link']);
                                    },
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(31, 128, 128, 128)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'ALTERNATIVE :',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: altMed
                            .map((e) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    "◉  ${e}",
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(31, 128, 128, 128)),
                  ),
                  const SizedBox(height: 35),
                  const Text(
                    'PRESCRIPTION :',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        prep.toUpperCase(),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(31, 128, 128, 128)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          launch('https://medorant-reward-system.vercel.app/');
                        },
                        child: const Text('Get your rewards')),
                  ),
                  const SizedBox(
                    height: 60,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
