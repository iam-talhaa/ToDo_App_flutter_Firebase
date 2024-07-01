import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter_firebase/firebase_options.dart';
import 'package:todo_flutter_firebase/homescreen.dart';

void main() async {
  runApp(ToDoAPP());

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class ToDoAPP extends StatefulWidget {
  const ToDoAPP({super.key});

  @override
  State<ToDoAPP> createState() => _ToDoAPPState();
}

class _ToDoAPPState extends State<ToDoAPP> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
