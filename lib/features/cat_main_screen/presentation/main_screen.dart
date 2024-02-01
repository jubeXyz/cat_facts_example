import 'package:cat_facts_example/features/cat_main_screen/application/cat_service.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.catService});

  final CatService catService;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
                      getCatData();
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

  void getCatData() async {
    final catData = await widget.catService.getCatData();
    catImageUri = catData.imageUrl;
    catFact = catData.catFact;
    setState(() {});
  }
}
