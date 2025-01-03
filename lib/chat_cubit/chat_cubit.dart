import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_19/chat_cubit/chat_states.dart';
import 'package:flutter_application_19/models/message_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/chat_service.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(InitialState());
  List<MessageModel> mesages = [
    MessageModel(
      role: 'developer',
      content: 'You are a helpful assistant.',
    )
  ];

  void sendMessage(String message) async {
    emit(LoadingState());
    try {
      var messageModel = MessageModel(
        role: 'user',
        content: message,
      );
      mesages.add(messageModel);
      var responseMessage = await ChatService.sendMessage(
        messages: mesages,
      );
      mesages.add(responseMessage);
      emit(MessageLoadedState());
    } on DioException catch (e) {
      var response = e.response?.data;
      String errMessage;
      if (response != null) {
        errMessage = response['error']['message'];
      } else {
        errMessage = 'Something went wrong';
      }

      emit(ErrorState(errMessage));
    } catch (e) {
      emit(ErrorState('Something went wrong'));
    }
  }
}


// local stoarge 