import 'package:flutter/material.dart';
import 'package:pokemon/core/ui/widgets/core_widgets.dart';

class MoveItem extends StatelessWidget {
  const MoveItem({super.key, required this.move});

  final String move;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(.20),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(.5),
            width: 1,
          ),
        ),
      ),
      child: BodyMedium(move),
    );
  }
}
