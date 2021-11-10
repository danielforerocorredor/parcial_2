import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:parcial_2/models.dart';

class DataService {
  Future<Response> getweather(String city) async {
    final queryParams = {
      'q': city,
      'lang': 'es',
      'units': 'metric',
      'appid': '45c49de29c42ac6c5a08190dd20748ef'
    };

    final uri =
        Uri.https('api.openweathermap.org', '/data/2.5/weather', queryParams);

    final res = await http.get(uri);

    // print(res.body);
    final json = jsonDecode(res.body);
    return Response.fromJson(json);
  }
}
