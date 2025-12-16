import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../engine/dialogue_engine.dart';
import '../models/dialogue.dart';

//import '../data/bellamy_script.dart'; // where bellamyIntroScript lives

class DialogueScreen extends StatelessWidget {
  const DialogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DialogueController(bellamyIntroScript),
      child: const _DialogueView(),
    );
  }
}

class _DialogueView extends StatelessWidget {
  const _DialogueView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DialogueController>();
    final line = controller.currentLine;

    return Scaffold(
      body: Stack(
        children: [
          // background
          Positioned.fill(
            child: Image.asset(
              'assets/backgrounds/night_camp.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // character sprite
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/characters/bellamy_neutral.PNG',
              height: 720,
            ),
          ),
          // dialogue UI
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // name bubble
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.lightGreen.shade100.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Text(
                        line.speaker,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // main text bubble
                  GestureDetector(
                    onTap: () {
                      if (!line.hasChoices) {
                        controller.next();
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.lightGreen.shade100.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Text(
                        line.text,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // choices (if any)
                  if (line.hasChoices)
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 8,
                      children: line.choices
                          .map(
                            (choice) => GestureDetector(
                          onTap: () => controller.choose(choice),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.lightGreen.shade100
                                  .withOpacity(0.9),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Text(choice.text),
                          ),
                        ),
                      )
                          .toList(),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
