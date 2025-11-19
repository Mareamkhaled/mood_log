class AnalyzeModel {
  final String label;
  final double score;
  const AnalyzeModel({required this.label, required this.score});

  factory AnalyzeModel.fromJson(Map<String, dynamic> json) {
    return AnalyzeModel(label: json["label"], score: json["score"]);
  }

  Map<String, dynamic> toJson() => {"label": label, "score": score};
}
