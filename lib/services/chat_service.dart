import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_application_19/models/choice_model.dart';
import 'package:flutter_application_19/models/message_model.dart';
import 'package:flutter_application_19/models/response_model/message.dart';
import 'package:flutter_application_19/services/api_service.dart';

class ChatService {
  static Future<MessageModel> sendMessage(
      {String model = "gpt-4o-mini",
      required List<MessageModel> messages}) async {
    await Future.delayed(const Duration(seconds: 1), () {});
    var data = await ApiService.postRequest(
      'https://api.openai.com/v1/chat/completions',
      {
        'model': model,
        'messages': messages.map((e) => e.toJson()).toList(),
      },
    );
    List<ChoiceModel> choices = [];
    for (var choice in data['choices']) {
      ChoiceModel choiceModel = ChoiceModel.fromJson(choice);

      choices.add(choiceModel);
    }

    return choices[0].messageModel;
  }
}

// define the map 
// create class 
// create from json 
// repeat 