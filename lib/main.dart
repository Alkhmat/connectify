import 'package:connectify/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Connectify());
}

class Connectify extends StatelessWidget {
  const Connectify({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
