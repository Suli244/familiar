import 'package:familiar/main.dart';
import 'package:flutter/material.dart';

void showSuccessSnackBar(String text) {
  scaffoldKey.currentState?.showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF026405),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Builder(builder: (context) {
          return Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          );
        }),
      ),
    ),
  );
}
