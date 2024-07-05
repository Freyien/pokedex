import 'package:flutter/material.dart';

class BackgroundLights extends StatelessWidget {
  const BackgroundLights({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Blue light
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset('assets/images/blue_home.png'),
        ),

        // Yellow light
        Center(
          child: Image.asset('assets/images/yellow_home.png'),
        ),

        // Child
        child,
      ],
    );
  }
}
