import 'choice.dart';
import 'usage.dart';

class ResponseModel {
  String? id;
  String? object;
  int? created;
  String? model;
  List<Choice>? choices;
  Usage? usage;
  String? systemFingerprint;

  ResponseModel({
    this.id,
    this.object,
    this.created,
    this.model,
    this.choices,
    this.usage,
    this.systemFingerprint,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        id: json['id'] as String?,
        object: json['object'] as String?,
        created: json['created'] as int?,
        model: json['model'] as String?,
        choices: (json['choices'] as List<dynamic>?)
            ?.map((e) => Choice.fromJson(e as Map<String, dynamic>))
            .toList(),
        usage: json['usage'] == null
            ? null
            : Usage.fromJson(json['usage'] as Map<String, dynamic>),
        systemFingerprint: json['system_fingerprint'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'object': object,
        'created': created,
        'model': model,
        'choices': choices?.map((e) => e.toJson()).toList(),
        'usage': usage?.toJson(),
        'system_fingerprint': systemFingerprint,
      };
}
