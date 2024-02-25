import 'package:http/http.dart' as http;
import 'dart:convert';

import 'header.dart';
import 'model.dart';

class Calltheapi {
  Future<void> fetchData() async {
    final response = await http
        .get(Uri.parse('https://api.rootnet.in/covid19-in/stats/latest'));

    if (response.statusCode == 200) {
      print(response.body);
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> regionalJson = data['data']['regional'];

      regionalData =
          regionalJson.map((json) => Regional.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
