import '../models/question.dart';

/// Static question bank. Swap this out for an API call or local
/// JSON/DB source later without touching any UI code.
final List<Question> quizQuestions = [
  const Question(
    questionText: 'What is the primary language used to write Flutter apps?',
    options: ['Kotlin', 'Dart', 'Swift', 'Java'],
    correctIndex: 1,
    category: 'Flutter Basics',
  ),
  const Question(
    questionText: 'Which widget is used to make a layout scrollable?',
    options: ['Container', 'Column', 'ListView', 'Stack'],
    correctIndex: 2,
    category: 'Widgets',
  ),
  const Question(
    questionText:
        'What method rebuilds a StatefulWidget with new data?',
    options: ['build()', 'initState()', 'setState()', 'dispose()'],
    correctIndex: 2,
    category: 'State Management',
  ),
  const Question(
    questionText: 'Which widget provides Material Design visual structure?',
    options: ['Scaffold', 'SafeArea', 'MediaQuery', 'Theme'],
    correctIndex: 0,
    category: 'Widgets',
  ),
  const Question(
    questionText: 'What is the purpose of the pubspec.yaml file?',
    options: [
      'Stores app screenshots',
      'Declares dependencies and assets',
      'Compiles Dart to native code',
      'Defines widget layouts',
    ],
    correctIndex: 1,
    category: 'Flutter Basics',
  ),
  const Question(
    questionText:
        'Which package is commonly used for simple, scalable state management?',
    options: ['http', 'provider', 'path', 'intl'],
    correctIndex: 1,
    category: 'State Management',
  ),
  const Question(
    questionText: 'What does "hot reload" do in Flutter development?',
    options: [
      'Restarts the entire app and clears state',
      'Injects updated code while preserving app state',
      'Rebuilds the native app binaries',
      'Deploys the app to app stores',
    ],
    correctIndex: 1,
    category: 'Tooling',
  ),
  const Question(
    questionText: 'Which widget is immutable and cannot change over time?',
    options: [
      'StatefulWidget',
      'InheritedWidget',
      'StatelessWidget',
      'AnimatedWidget',
    ],
    correctIndex: 2,
    category: 'Widgets',
  ),
];
