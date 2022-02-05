import 'package:globo_fitness/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  //http://api.openweathermap.org/data/2.5/weather?q
  // =London&appid=2761acf922570e26fbfdf646ff2c4c07
  final String authority='api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '2761acf922570e26fbfdf646ff2c4c07';

  Future <Weather> getWeather (String location)async{
    Map<String, dynamic> paramters = {'q' : location,'appId':apiKey};
    Uri uri =Uri.https(authority, path, paramters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);

    return weather;
  }
}