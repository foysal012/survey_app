import 'package:flutter/material.dart';
import 'package:survey_app/resources/app_url.dart';
import '../model/question_response.dart';
import '../services/api_services.dart';


class QuestionRepository{

  static final _apiServices = ApiServices();

  // Get Question
  static Future<QuestionResponse> getQuestion() async{

    String url = AppUrl.getQuestion;

    var response = await _apiServices.getApi(url);
    if(response == null){

    }

    debugPrint("Response JSON: $response");
    return QuestionResponse.fromJson(response);
  }


}