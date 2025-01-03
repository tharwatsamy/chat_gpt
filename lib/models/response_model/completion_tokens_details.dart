class CompletionTokensDetails {
  int? reasoningTokens;
  int? audioTokens;
  int? acceptedPredictionTokens;
  int? rejectedPredictionTokens;

  CompletionTokensDetails({
    this.reasoningTokens,
    this.audioTokens,
    this.acceptedPredictionTokens,
    this.rejectedPredictionTokens,
  });

  factory CompletionTokensDetails.fromJson(Map<String, dynamic> json) {
    return CompletionTokensDetails(
      reasoningTokens: json['reasoning_tokens'] as int?,
      audioTokens: json['audio_tokens'] as int?,
      acceptedPredictionTokens: json['accepted_prediction_tokens'] as int?,
      rejectedPredictionTokens: json['rejected_prediction_tokens'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'reasoning_tokens': reasoningTokens,
        'audio_tokens': audioTokens,
        'accepted_prediction_tokens': acceptedPredictionTokens,
        'rejected_prediction_tokens': rejectedPredictionTokens,
      };
}
