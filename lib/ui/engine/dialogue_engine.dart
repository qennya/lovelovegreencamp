import '../models/dialogue.dart';
import 'package:flutter/foundation.dart';

class DialogueController extends ChangeNotifier {
  final List<DialogueLine> script;
  int _currentIndex = 0;

  DialogueController(this.script);

  DialogueLine get currentLine => script[_currentIndex];

  void next() {
    if (currentLine.hasChoices) return; // choices must be picked
    if (_currentIndex < script.length - 1) {
      _currentIndex++;
      notifyListeners();
    }
  }

  void choose(DialogueChoice choice) {
    _currentIndex = choice.nextIndex;
    notifyListeners();
  }
}
