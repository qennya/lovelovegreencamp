import 'package:flutter/material.dart';
import 'ui/screens/title_screen.dart';
import 'ui/screens/dialogue_screen.dart';

void main() {
  runApp(const LoveLoveCampApp());
}

class LoveLoveCampApp extends StatelessWidget {
  const LoveLoveCampApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Love Love Camp',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const TitleScreen(),
        '/dialogue': (context) => const DialogueScreen(),
      },
    );
  }
}
