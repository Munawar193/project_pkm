import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rice_quality_scanning/model/weather_model.dart';

//https://api.openweathermap.org/data/2.5/weather?q=Aceh&appid=1f2ac2140cc14ef9e6fa782d34018057&units=metric
class WeatherApi {
  Future getCurrentWeather(String? location) async {
    try {
      var endpoint = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=1f2ac2140cc14ef9e6fa782d34018057&units=metric');
      var respone = await http.get(endpoint);
      var body = jsonDecode(respone.body);
      print(respone.body);
      return WeatherModel.fromJson(body);
    } catch (e) {
      e.toString();
    }
  }
}
