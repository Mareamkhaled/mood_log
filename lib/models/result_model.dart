import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'analyze_model.dart';

class ResultModel extends Equatable {
  final String id;
  final String text;           
  final String mood;
  final double score;
  final String emoji;
  final Color color;
  final DateTime date;         

  const ResultModel({
    required this.id,
    required this.text,
    required this.mood,
    required this.score,
    required this.emoji,
    required this.color,
    required this.date,
  });


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'mood': mood,
      'score': score,
      'emoji': emoji,
      'color': color.value,
      'date': date.toIso8601String(),
    };
  }

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      id: json['id'],
      text: json['text'],
      mood: json['mood'],
      score: (json['score'] as num).toDouble(),
      emoji: json['emoji'],
      color: Color(json['color']),
      date: DateTime.parse(json['date']),
    );
  }

  static ResultModel moodJournal(AnalyzeModel analyzeModel, String text) {
    final DateTime now = DateTime.now();
    final String id = now.millisecondsSinceEpoch.toString();

    switch (analyzeModel.label) {
      case "joy":
        return ResultModel(
          id: id,
          text: text,
          mood: analyzeModel.label,
          score: analyzeModel.score,
          emoji: "😊",
          color: const Color(0xFFFBBF24),
          date: now,
        );
      case "sadness":
        return ResultModel(
          id: id,
          text: text,
          mood: analyzeModel.label,
          score: analyzeModel.score,
          emoji: "😢",
          color: const Color(0xFF3B82F6),
          date: now,
        );
      case "anger":
        return ResultModel(
          id: id,
          text: text,
          mood: analyzeModel.label,
          score: analyzeModel.score,
          emoji: "😤",
          color: const Color(0xFFEF4444),
          date: now,
        );
      case "surprise":
        return ResultModel(
          id: id,
          text: text,
          mood: analyzeModel.label,
          score: analyzeModel.score,
          emoji: "😲",
          color: const Color(0xFF8B5CF6),
          date: now,
        );
      case "neutral":
        return ResultModel(
          id: id,
          text: text,
          mood: analyzeModel.label,
          score: analyzeModel.score,
          emoji: "😐",
          color: const Color(0xFF9CA3AF),
          date: now,
        );
      case "fear":
        return ResultModel(
          id: id,
          text: text,
          mood: analyzeModel.label,
          score: analyzeModel.score,
          emoji: "😨",
          color: const Color(0xFFF97316),
          date: now,
        );
      case "disgust":
        return ResultModel(
          id: id,
          text: text,
          mood: analyzeModel.label,
          score: analyzeModel.score,
          emoji: "🤢",
          color: const Color(0xFF059669),
          date: now,
        );
      default:
        return ResultModel(
          id: id,
          text: text,
          mood: analyzeModel.label,
          score: analyzeModel.score,
          emoji: "😐",
          color: const Color(0xFF9CA3AF),
          date: now,
        );
    }
  }

  @override
  List<Object?> get props => [id, text, mood, score, emoji, color, date];
}