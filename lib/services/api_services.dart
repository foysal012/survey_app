import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  //Header without File
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  static Map<String, String> headerWithAuthorization({required String token}) {
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }

  dynamic jsonData;

  // Get Api Services
  Future<dynamic> getApi(String url) async {
    try {
      debugPrint(url);

      final response = await http.get(Uri.parse(url));
      jsonData = returnResponse(response);

    } catch (e) {
      debugPrint('$e');
    }
    return jsonData;
  }

  // Post Api Services
  Future<dynamic> postApi({
    required String url,
    required Map<String, String> headers,
    required dynamic data
  }) async {
    try {
      debugPrint(url);
      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(data));
      jsonData = returnResponse(response);
    } catch (e) {
      debugPrint('$e');
    }

    return jsonData;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        jsonData = jsonDecode(response.body);
        return jsonData;
      case 201:
        jsonData = jsonDecode(response.body);
        return jsonData;
      case 400:
        jsonData = jsonDecode(response.body);
        return jsonData;
      case 401:
        jsonData = jsonDecode(response.body);
        return jsonData;
      case 404:
        debugPrint('Not Found');
        jsonData = jsonDecode(response.body);
        return jsonData;
      case 500:
        debugPrint('Server Error - [500]');

      default:
        debugPrint('Unknown Error Occurred - ${response.statusCode}');
    }
  }

}