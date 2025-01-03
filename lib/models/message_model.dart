import 'package:hive_flutter/hive_flutter.dart';
part 'message_model.g.dart';

@HiveType(typeId: 0)
class MessageModel extends HiveObject {
  @HiveField(0)
  final String role;

  @HiveField(1)
  final String content;

  MessageModel({required this.role, required this.content});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
        role: json['message']['role'], content: json['message']['content']);
  }

  toJson() => {
        'role': role,
        'content': content,
      };
}
