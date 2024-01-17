import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MainApp());
}

const catImageUri = 'https://api.thecatapi.com/v1/images/search';
const catFactUri = 'https://meowfacts.herokuapp.com/';

Future<String> getDataFromApi(String uri) async {
  final response = await get(Uri.parse(uri));

  return response.body;
}

Future<String> getCatImageUrl() async {
  final jsonString = await getDataFromApi(catImageUri);
  debugPrint(jsonString);

  final jsonObject = jsonDecode(jsonString);

  return jsonObject[0]['url'];
}

Future<String> getCatFact() async {
  final jsonString = await getDataFromApi(catFactUri);
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
  // Use this as a standard image while no other is loaded yet.
  String catImageUri = "https://cdn2.thecatapi.com/images/o0.gif";
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
                  Image.network(catImageUri),
                  const SizedBox(height: 16),
                  Text(catFact),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () {
                      getFact();
                      getImageUri();
                    },
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

  void getImageUri() async {
    catImageUri = await getCatImageUrl();
    setState(() {});
  }

  void getFact() async {
    catFact = await getCatFact();
    setState(() {});
  }
}
