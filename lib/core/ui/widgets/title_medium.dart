import 'package:flutter/material.dart';

class TitleMedium extends StatelessWidget {
  const TitleMedium(this.text, {super.key, this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium?.merge(style),
    );
  }
}
