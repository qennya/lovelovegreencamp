class DialogueLine {
  final String speaker; // 'Bellamy' or 'Player'
  final String text;
  final List<DialogueChoice> choices;

  DialogueLine({
    required this.speaker,
    required this.text,
    this.choices = const [],
  });

  bool get hasChoices => choices.isNotEmpty;
}

class DialogueChoice {
  final String text;
  final int nextIndex; // index of next line

  DialogueChoice({required this.text, required this.nextIndex});
}
final List<DialogueLine> bellamyIntroScript = [
  DialogueLine(
    speaker: 'Bellamy',
    text: 'Hey, dorms are that way, are you lost?',
  ),
  DialogueLine(
    speaker: 'Player',
    text: '',
    choices: [
      DialogueChoice(text: 'I\'m not lost.', nextIndex: 2),
      DialogueChoice(text: 'Yes, can you help me?', nextIndex: 3),
    ],
  ),
  DialogueLine(
    speaker: 'Bellamy',
    text: 'Oh, so you *meant* to wander into my camp, huh?',
  ),
  DialogueLine(
    speaker: 'Bellamy',
    text: 'Sure, come on. I\'ll walk you over.',
  ),
];
