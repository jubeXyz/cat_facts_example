import 'package:http/http.dart';

Future<String> getDataFromApi(String uri) async {
  final response = await get(Uri.parse(uri));

  return response.body;
}
