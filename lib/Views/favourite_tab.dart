import 'package:dating_app/Resorces/app_style.dart';
import 'package:flutter/material.dart';

class FavouriteTabView extends StatelessWidget {
  const FavouriteTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Favourite Tab",
          style: AppStyles.of(context).figtreeMedium.copyWith(fontSize: 25),
        ),
      ),
    );
  }
}
