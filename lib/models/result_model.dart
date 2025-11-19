import 'package:flutter/material.dart';
import 'analyze_model.dart';

class ResultModel {
  final String mood;
  final double score;
  final String emoji;
  final Color color;

  ResultModel({
    required this.mood,
    required this.score,
    required this.emoji,
    required this.color,
  });

  static ResultModel moodJournal(AnalyzeModel analyzeModel) {
    switch (analyzeModel.label) {
      case "joy":
        return ResultModel (
          mood: analyzeModel.label,
          score: analyzeModel.score,
          emoji: "😊",
          color: const Color(0xFFFBBF24),
        );
      case "sadness":
        return ResultModel (
          mood: analyzeModel.label,
          score: analyzeModel.score,
          emoji: "😢",
          color: const Color(0xFF3B82F6),
        );
        case "anger":
        return ResultModel (
          mood: analyzeModel.label,
          score: analyzeModel.score,
          emoji: "😤",
          color: const Color(0xFFEF4444),
         );
        case "surprise":
        return ResultModel (
          mood: analyzeModel.label,
          score: analyzeModel.score,
          emoji: "😲",
          color: const Color(0xFF8B5CF6),
        );
        case "neutral":
        return ResultModel (
          mood: analyzeModel.label,
          score: analyzeModel.score,
          emoji: "😐",
          color: const Color(0xFF9CA3AF),
          );

          case "fear":
          return ResultModel (
            
            mood: analyzeModel.label,
            score: analyzeModel.score,
            emoji: "😨",
            color: const Color(0xFFF97316),

          );

          case "disgust":
          return ResultModel (
            mood: analyzeModel.label,
            score: analyzeModel.score,
            emoji: "🤢",
            color: const Color(0xFF059669),
          );

          default:
          return ResultModel (
            mood: analyzeModel.label,
            score: analyzeModel.score,
            emoji: "😐",
            color: const Color(0xFF9CA3AF),
          );   
    }
  }
}

