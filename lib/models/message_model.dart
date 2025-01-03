class MessageModel {
  final String role;
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
