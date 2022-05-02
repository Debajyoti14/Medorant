import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medorant/utils/themes.dart';

import 'package:http/http.dart' as http;
import './login_disease.dart';

class LoginEdit extends StatefulWidget {
  const LoginEdit({Key? key}) : super(key: key);

  @override
  State<LoginEdit> createState() => _LoginEditState();
}

class _LoginEditState extends State<LoginEdit> {
  final _formkey = GlobalKey<FormState>();
  String? _selectedOption;
  String? name;
  String? email;
  int? age;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as String;
    Future<http.Response> sendData(String id) async {
      final response = await http.get(Uri.parse(
          'https://8g34ra4qq2.execute-api.ap-south-1.amazonaws.com/dev/user/$id'));
      final getResponse = await json.decode(response.body);
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
          "disease": [],
          "recent_searches": [],
          "searches": 0,
          "email": getResponse[0]['email'],
          "name": getResponse[0]['name'],
          "gender": _selectedOption,
          "age": age,
        }),
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Text(
                  'Personal Details',
                  style: TextStyle(
                      color: AppTheme.lightTheme(context).primaryColor,
                      fontSize: 26),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 50,
                ),
                Form(
                  key: _formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: "Age",
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) =>
                                    setState(() => age = int.parse(value)),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Age can't be Empty";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: DropdownButton<String>(
                                hint: const Text(
                                    'Gender'), // Not necessary for Option 1
                                value: _selectedOption,
                                items: <String>[
                                  'Male',
                                  'Female',
                                  'prefer not to say'
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    _selectedOption = val!;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppTheme.lightTheme(context).primaryColor)),
                            onPressed: () {
                              if (_formkey.currentState!.validate() == true) {
                                _formkey.currentState?.save();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginDisease(),
                                      settings: RouteSettings(arguments: args),
                                    ));
                                sendData(args);
                              } else {
                                return;
                              }
                            },
                            child: const Text('Next'),
                          ),
                          width: double.infinity,
                          height: 40,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Image.asset('assets/images/personal.png')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
