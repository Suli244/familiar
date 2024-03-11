import 'package:familiar/style/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Чат',
          style: AppTextStyles.s21W600(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 27, 32, 84),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 27, 32, 84),
              Color.fromARGB(255, 11, 6, 42),
              Colors.black,
            ],
          ),
        ),
        child: const Column(),
      ),
    );
  }
}
