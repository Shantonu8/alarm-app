
import 'package:http/http.dart' as http;


class DataService{
  void getWeather(String lat, String lon)async{

    // api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}

    final queryParameters = {
      'lat': lat,
      'lon': lon,
      'appid': '3cea435f15a57fad2a21a88e7a6edd38'
    };

  
  final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', queryParameters );


    final response = await http.get(uri);


    print(response.body);
  }
}