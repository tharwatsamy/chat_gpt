import 'completion_tokens_details.dart';
import 'prompt_tokens_details.dart';

class Usage {
  int? promptTokens;
  int? completionTokens;
  int? totalTokens;
  PromptTokensDetails? promptTokensDetails;
  CompletionTokensDetails? completionTokensDetails;

  Usage({
    this.promptTokens,
    this.completionTokens,
    this.totalTokens,
    this.promptTokensDetails,
    this.completionTokensDetails,
  });

  factory Usage.fromJson(Map<String, dynamic> json) => Usage(
        promptTokens: json['prompt_tokens'] as int?,
        completionTokens: json['completion_tokens'] as int?,
        totalTokens: json['total_tokens'] as int?,
        promptTokensDetails: json['prompt_tokens_details'] == null
            ? null
            : PromptTokensDetails.fromJson(
                json['prompt_tokens_details'] as Map<String, dynamic>),
        completionTokensDetails: json['completion_tokens_details'] == null
            ? null
            : CompletionTokensDetails.fromJson(
                json['completion_tokens_details'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'prompt_tokens': promptTokens,
        'completion_tokens': completionTokens,
        'total_tokens': totalTokens,
        'prompt_tokens_details': promptTokensDetails?.toJson(),
        'completion_tokens_details': completionTokensDetails?.toJson(),
      };
}
