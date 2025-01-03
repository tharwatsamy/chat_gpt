import 'package:dio/dio.dart';
import 'package:flutter_application_19/api_keys.dart';

class ApiService {
  static const String _apiKey = openAiApiKey;

  static Future<dynamic> postRequest(
      String url, Map<String, dynamic> data) async {
    var response = await Dio(BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      },
    )).post(url, data: data);

    return response.data;
  }
}
// Getx