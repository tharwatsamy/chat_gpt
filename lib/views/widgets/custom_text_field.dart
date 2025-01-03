import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_19/chat_cubit/chat_cubit.dart';
import 'package:flutter_application_19/services/chat_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatTextField extends StatelessWidget {
  final List<dynamic> messages;
  final TextEditingController controller;
  final Function(String)? onSubmitted;
  final Function rebuildUi;
  const ChatTextField(
      {super.key,
      required this.messages,
      required this.rebuildUi,
      required this.controller,
      this.onSubmitted});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (value) async {
        controller.clear();
        rebuildUi();
        var chatCubit = BlocProvider.of<ChatCubit>(context);
        chatCubit.sendMessage(value);
      },
      decoration: InputDecoration(
        hintText: 'Type a message',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
