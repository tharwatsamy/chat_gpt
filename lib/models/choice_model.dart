import 'package:flutter_application_19/models/message_model.dart';

class ChoiceModel {
  final int index;
  final MessageModel messageModel;
  ChoiceModel({required this.index, required this.messageModel});

  factory ChoiceModel.fromJson(Map<String, dynamic> json) {
    return ChoiceModel(
      index: json['index'],
      messageModel: MessageModel.fromJson(json),
    );
  }
}
