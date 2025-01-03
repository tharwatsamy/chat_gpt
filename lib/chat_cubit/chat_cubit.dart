import 'package:flutter/material.dart';
import 'package:flutter_application_19/chat_cubit/chat_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/chat_service.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(InitialState());
  List<dynamic> mesages = [
    {
      "role": "developer",
      "content": "You are a helpful assistant.",
    },
  ];

  void sendMessage(String message) async {
    mesages.add({
      "role": "user",
      "content": message,
    });
    var responseMessage = await ChatService.sendMessage(
      messages: mesages,
    );
    mesages.add({
      "role": "assistant",
      "content": responseMessage,
    });
  }


  
}
