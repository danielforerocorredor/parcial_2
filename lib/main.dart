import 'package:flutter/material.dart';
import 'package:parcial_2/data_service.dart';
import 'package:parcial_2/models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  @override
  Widget build(BuildContext) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: SizedBox(
              width: 150,
              child: TextField(
                  controller: _cityTextController,
                  decoration: InputDecoration(labelText: 'Nombre de la ciudad'),
                  textAlign: TextAlign.center),
            ),
          ),
          ElevatedButton(onPressed: _search, child: Text('Buscar'))
        ],
      ),
    )));
  }

  void _search() async {
    final response = await _dataService.getweather(_cityTextController.text);
    print(response.cityName);
    print(response.mainInfo.temperature);
    print(response.mainInfo.humidity);
    print(response.weatherInfo.description);
    print(response.windInfo.windSpeed);
  }
}
