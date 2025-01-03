import 'package:dio/dio.dart';
import 'package:flutter_application_19/models/choice_model.dart';
import 'package:flutter_application_19/models/message_model.dart';
import 'package:flutter_application_19/services/api_service.dart';

class ChatService {
  static Future<MessageModel> sendMessage(
      {String model = "gpt-4o-mini", required List<dynamic> messages}) async {
    try {
      var data = await ApiService.postRequest(
        'https://api.openai.com/v1/chat/completions',
        {
          'model': model,
          'messages': messages,
        },
      );
      List<ChoiceModel> choices = [];
      for (var choice in data['choices']) {
        ChoiceModel choiceModel = ChoiceModel.fromJson(choice);

        choices.add(choiceModel);
      }

      return messageModel;
    } on DioException catch (e) {

    e.response.data
    } catch (e) {
      return MessageModel(role: '', content: 'Error');
    }
  }
}

// define the map 
// create class 
// create from json 
// repeat 