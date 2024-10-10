import 'package:dating_app/Resorces/app_style.dart';
import 'package:flutter/material.dart';

class ChatTabView extends StatelessWidget {
  const ChatTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Chat Tab",
          style: AppStyles.of(context).figtreeMedium.copyWith(fontSize: 25),
        ),
      ),
    );
  }
}
