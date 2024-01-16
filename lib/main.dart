import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MainApp());
}

const uriString = 'https://meowfacts.herokuapp.com/';

Future<String> getDataFromApi() async {
  final response = await get(Uri.parse(uriString));

  return response.body;
}

Future<String> getCatFact() async {
  final jsonString = await getDataFromApi();
  debugPrint(jsonString);

  final jsonObject = jsonDecode(jsonString);

  final catFact = jsonObject['data'][0];

  return catFact;
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String catFact = "None fetched yet";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(catFact),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: getFact,
                    child: const Text("Get Random Cat Fact"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getFact() async {
    catFact = await getCatFact();
    setState(() {});
  }
}
