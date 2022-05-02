import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medorant/utils/themes.dart';
import 'package:http/http.dart' as http;

import '../widgets/disease_tag.dart';
import 'main_home.dart';
import 'navigation.dart';

class LoginDisease extends StatefulWidget {
  const LoginDisease({Key? key}) : super(key: key);

  @override
  State<LoginDisease> createState() => _LoginDiseaseState();
}

class _LoginDiseaseState extends State<LoginDisease> {
  final tags = <String>[];

  final diseases = [
    "Vomiting",
    "Nausea",
    "Cough",
    "Headache",
    "Erythema",
    "Rash",
    "hives",
    "Skin peeling",
    "Dry skin",
    "Fever",
    "Abdominal pain",
    "Acne",
    "Stomach pain",
    "Infection",
    "Diabetes",
    "Thyroid",
    "Coeliac",
    "Tuberculosis",
    "Diarrhea",
    "Aids",
    "Piles",
    "Sugar",
    "Constipation"
  ];
  Future<http.Response> sendData(String id) async {
    final response = await http.get(Uri.parse(
        'https://8g34ra4qq2.execute-api.ap-south-1.amazonaws.com/dev/user/$id'));
    final getResponse = json.decode(response.body);
    return http.post(
      Uri.parse(
          'https://8g34ra4qq2.execute-api.ap-south-1.amazonaws.com/dev/user'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "user_id": id,
        "image": getResponse[0]['image'],
        "favourites": [],
        "disease": tags,
        "recent_searches": [],
        "searches": 0,
        "email": getResponse[0]['email'],
        "name": getResponse[0]['name'],
        "gender": getResponse[0]['gender'],
        "age": getResponse[0]['age'],
      }),
    );
  }

  final diseaseList = TextEditingController();

  void doSomething(value) {
    if (value == '') {
      null;
    } else {
      tags.add(value);
    }
    setState(() {});
    diseaseList.clear();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    return MaterialApp(
      home: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            children: [
              const SizedBox(
                height: 170,
              ),
              Text(
                'Do you Have a disease?',
                style: TextStyle(
                  color: AppTheme.lightTheme(context).primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // TextFormField(
              //   decoration: const InputDecoration(
              //     labelText: "Disease",
              //     border: OutlineInputBorder(),
              //   ),
              //   controller: diseaseList,
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return "Username cant be Empty";
              //     } else {
              //       return null;
              //     }
              //   },
              //   onFieldSubmitted: doSomething,
              // ),
              DropdownButton<String>(
                hint: const Text('Diseases'), // Not necessary for Option 1
                items: diseases.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    doSomething(val);
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(5),
                height: 164,
                width: double.infinity,
                child: SizedBox(
                  height: double.infinity,
                  child: Wrap(
                    children: tags.map((d) {
                      return Tags(d);
                    }).toList(),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    width: 1,
                    color: const Color.fromARGB(255, 148, 114, 232),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 148, 114, 232))),
                  onPressed: () {
                    sendData(args as String);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => Navigation(args as String),
                        // settings: RouteSettings(arguments: args),
                      ),
                    );
                  },
                  child: const Text('Submit'),
                ),
                width: double.infinity,
                height: 40,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
