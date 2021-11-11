import 'package:flutter/material.dart';
import 'package:parcial_2/clima.dart';
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

  dynamic _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_response != null)
            Column(
              children: [
                Text(
                  '${_response.cityName}',
                  style: TextStyle(fontSize: 25),
                ),
                Text('${_response.mainInfo.temperature}˚',
                    style: TextStyle(fontSize: 40)),
                Text('${_response.weatherInfo.description}',
                    style: TextStyle(fontSize: 20)),
                Text('Humidity: ${_response.mainInfo.humidity.toString()}'),
                Text('Wind Speed: ${_response.windInfo.windSpeed.toString()}'),
              ],
            ),
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

    setState(() => _response = response);
  }
}
