import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);

  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '1ab5bf2efaf54bc084a180126252608';

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no',
      );

      if (response.statusCode == 200) {
        WeatherModel weatherModel = WeatherModel.fromJson(response.data);
        print("Success");
        return weatherModel;
      } else {
        final String erroMsg = response.data["error"]["message"];
        throw Exception(erroMsg);
      }
    } on DioException catch (e) {
      final String erroMsg = e.response?.data["error"]["message"] ?? "OOPS there is was an erro";
      throw Exception(erroMsg);
    } catch (e) {
      throw Exception();
    }
  }
}
