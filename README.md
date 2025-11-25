# MoodLog 📔✨
A beautiful and intuitive mood tracking application built with Flutter. Track your daily emotions, get AI-powered sentiment analysis, visualize mood trends, and gain meaningful insights into your emotional well-being.

# Project Overview
MoodLog is a personal mood tracking journal that combines the simplicity of daily journaling with the power of AI sentiment analysis. Write freely about your day, and let machine learning detect your emotional state. Track patterns over time with beautiful analytics, visualizations, and personalized insights.
Whether you're looking to understand your emotions better or maintain a daily wellness routine, MoodLog makes emotional tracking fun and meaningful.

# Tech Stack
Frontend

Framework: Flutter - Cross-platform mobile development
Language: Dart - Modern, object-oriented programming language
State Management: BLoC Pattern with flutter_bloc & hydrated_bloc
UI Components:

table_calendar - Beautiful calendar widget
gap - Consistent spacing utilities
fl_chart - Advanced charting library



Backend & Services

AI/ML: Hugging Face Inference API - Emotion detection using j-hartmann/emotion-english-distilroberta-base
HTTP Client: Dio - Robust HTTP request library
Data Persistence: HydratedBloc - Local state persistence

Architecture & Design

Dependency Injection: GetIt
Environment Variables: Envied - Secure API key management
Date Handling: Intl - Internationalization
File System: Path Provider

Testing & Development

Device Preview: device_preview - Multi-device testing
Code Generation: build_runner
Linting: flutter_lints

# Architecture
<img width="687" height="725" alt="image" src="https://github.com/user-attachments/assets/fabeedd6-640e-42b6-b121-3b91ee8f5655" />

Architecture Pattern: BLoC (Business Logic Component)

* Cubits manage distinct features (sentiment analysis, journal entries)
* States represent UI states (Loading, Loaded, Failure)
* Hydrated Storage persists state locally across app restarts
* Dependency Injection via GetIt for loose coupling
  
# Features
📝 Core Features

✅ Daily Journal Entry - Write freely about your day

✅ AI-Powered Emotion Detection - Real-time sentiment analysis using Hugging Face 

✅ Emotion Classification - 7 emotion categories (Joy, Sadness, Anger, Surprise, Fear,  Disgust, Neutral) 

✅ Entry Management - Create, read, update, and delete journal entries 

✅ Persistent Storage - All entries automatically saved locally 

📊 Analytics & Insights

✅ Interactive Calendar - Visual mood history with emoji indicators

✅ Mood Distribution Chart - Pie chart showing emotion breakdown for current month

✅ Dominant Mood Card - Highlights most frequent emotion with percentage.

# Demo Video

https://github.com/user-attachments/assets/ca4b1a16-7d53-4fd1-afde-4054d2b26ab4




