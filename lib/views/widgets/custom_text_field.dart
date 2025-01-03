import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_19/services/chat_service.dart';

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

        messages.add({
          "role": "user",
          "content": value,
        });
        var responseMessage = await ChatService.sendMessage(
          messages: messages,
        );
        rebuildUi();
        messages.add({
          "role": "assistant",
          "content": responseMessage,
        });
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
