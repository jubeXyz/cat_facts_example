import 'package:cat_facts_example/cat_api_repository.dart';
import 'package:cat_facts_example/cat_data_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late List<CatDataModel?> catList = [];
  final CatApiRepository catApiRepository = CatApiRepository();

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      final List<CatDataModel?> fetchedCatData =
          await catApiRepository.fetchCatData();
      setState(() {
        catList = fetchedCatData;
      });
    } catch (e) {
      print("Failed to fetch data $e");
    }
  }

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
                  for (var catData in catList)
                    if (catData is CatImageModel)
                      Column(
                        children: [
                          Image.network(
                            catData.url!,
                          ),
                          const SizedBox(height: 20),
                        ],
                      )
                    else if (catData is CatFactModel)
                      Text(
                        catData.data!,
                      ),
                  const SizedBox(height: 80),
                  OutlinedButton(
                    onPressed: () {
                      getData();
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
}
