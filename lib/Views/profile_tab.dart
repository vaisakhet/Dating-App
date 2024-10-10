import 'package:dating_app/Resorces/app_style.dart';
import 'package:flutter/material.dart';

class ProfileTabView extends StatefulWidget {
  const ProfileTabView({super.key});

  @override
  State<ProfileTabView> createState() => _ProfileTabViewState();
}

class _ProfileTabViewState extends State<ProfileTabView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Profile Tab",
            style: AppStyles.of(context).figtreeMedium.copyWith(fontSize: 25)),
      ),
    );
  }
}
