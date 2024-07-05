import 'package:flutter/material.dart';

class LabelMedium extends StatelessWidget {
  const LabelMedium(this.text, {super.key, this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelMedium?.merge(style),
    );
  }
}
