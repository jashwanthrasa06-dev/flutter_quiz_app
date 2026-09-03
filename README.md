# Flutter Quiz App

An interactive mobile quiz application built with Flutter and Dart. Displays
one question at a time, lets the user pick an answer with instant
correct/incorrect visual feedback, tracks the running score, and shows a
final results screen with a percentage and retry option.

## Features

- Question display with progress indicator (`Question X of Y`)
- Tap-to-select answers with green/red feedback once answered
- Running score shown live in the app bar during the quiz
- Results screen with percentage score and contextual feedback message
- "Retry Quiz" and "Back to Home" flows
- Light/dark theme support (Material 3)

## Tech Stack

- **Flutter** / **Dart**
- **provider** package for state management (`ChangeNotifier` +
  `ChangeNotifierProvider` / `Consumer`)

## Project Structure

```
lib/
├── main.dart                  # App entry point, theme, provider setup
├── models/
│   └── question.dart          # Question data model
├── data/
│   └── questions_data.dart    # Static question bank (swap for an API later)
├── providers/
│   └── quiz_provider.dart     # Quiz state: index, score, answered flag
├── screens/
│   ├── home_screen.dart       # Start screen
│   ├── quiz_screen.dart       # Question + answers screen
│   └── result_screen.dart     # Final score screen
└── widgets/
    ├── answer_button.dart     # Answer option tile with color feedback
    └── progress_bar.dart      # "Question X of Y" progress bar
```

## Getting Started

1. Make sure the [Flutter SDK](https://docs.flutter.dev/get-started/install)
   is installed and `flutter doctor` passes.
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run on a connected device / emulator:
   ```bash
   flutter run
   ```

## Extending It

- **New questions**: add entries to the `quizQuestions` list in
  `lib/data/questions_data.dart` — no other file needs to change.
- **Remote questions**: replace the static list with an API call (e.g. via
  `http`) inside `QuizProvider`, exposing the same getters.
- **Timers per question**: add a `Timer` in `QuizProvider` and call
  `nextQuestion()` on expiry.
- **Persistent high scores**: add `shared_preferences` and save
  `quiz.score` / `quiz.scorePercentage` in `ResultScreen`.
