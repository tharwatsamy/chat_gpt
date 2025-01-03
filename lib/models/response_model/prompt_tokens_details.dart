class PromptTokensDetails {
  int? cachedTokens;
  int? audioTokens;

  PromptTokensDetails({this.cachedTokens, this.audioTokens});

  factory PromptTokensDetails.fromJson(Map<String, dynamic> json) {
    return PromptTokensDetails(
      cachedTokens: json['cached_tokens'] as int?,
      audioTokens: json['audio_tokens'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'cached_tokens': cachedTokens,
        'audio_tokens': audioTokens,
      };
}
