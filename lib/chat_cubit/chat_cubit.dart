import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_19/chat_cubit/chat_states.dart';
import 'package:flutter_application_19/models/message_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../services/chat_service.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(InitialState());
  
  void sendMessage(String message) async {
    emit(LoadingState());
    try {
      var messagesBox = Hive.box<MessageModel>('messages');
      var messageModel = MessageModel(
        role: 'user',
        content: message,
      );
      messagesBox.add(messageModel);
      var responseMessage = await ChatService.sendMessage(
        messages: messagesBox.values.toList(),
      );
      messagesBox.add(responseMessage);
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