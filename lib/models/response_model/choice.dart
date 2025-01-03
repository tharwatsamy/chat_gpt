import 'message.dart';

class Choice {
  int? index;
  Message? message;
  dynamic logprobs;
  String? finishReason;

  Choice({this.index, this.message, this.logprobs, this.finishReason});

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        index: json['index'] as int?,
        message: json['message'] == null
            ? null
            : Message.fromJson(json['message'] as Map<String, dynamic>),
        logprobs: json['logprobs'] as dynamic,
        finishReason: json['finish_reason'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'index': index,
        'message': message?.toJson(),
        'logprobs': logprobs,
        'finish_reason': finishReason,
      };
}
