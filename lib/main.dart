import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter_firebase/firebase_options.dart';
import 'package:todo_flutter_firebase/splashScreen.dart';
import 'package:todo_flutter_firebase/ui/splashServi/AUth/login_screen.dart';
import 'package:todo_flutter_firebase/ui/splashServi/AUth/signup_screen.dart';

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
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
