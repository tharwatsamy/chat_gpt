class Message {
  String? role;
  String? content;
  dynamic refusal;

  Message({this.role, this.content, this.refusal});

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        role: json['role'] as String?,
        content: json['content'] as String?,
        refusal: json['refusal'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'role': role,
        'content': content,
        'refusal': refusal,
      };
}
