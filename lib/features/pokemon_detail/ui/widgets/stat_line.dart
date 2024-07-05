import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/core/ui/widgets/core_widgets.dart';
import 'package:pokemon/features/pokemon_list/domain/entities/stat_entity.dart';

class StatLine extends StatelessWidget {
  const StatLine({
    super.key,
    required this.stat,
    required this.color,
  });

  final StatEntity stat;
  final Color color;

  String get statName {
    switch (stat.name) {
      case 'hp':
        return 'HP';
      case 'attack':
        return 'Attack';
      case 'defense':
        return 'Defense';
      case 'special-attack':
        return 'Sp atk';
      case 'special-defense':
        return 'Sp def';
      case 'speed':
        return 'Speed';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: LayoutBuilder(builder: (context, constraints) {
        return Row(
          children: [
            Expanded(
              child: FadeInLeft(
                from: 10,
                child: BodyMedium(statName),
              ),
            ),
            HorizontalSpace.xxlarge(),
            FadeInLeft(
              from: 10,
              child: LabelMedium(
                stat.base.toString(),
                style: TextStyle(
                  color: color,
                ),
              ),
            ),
            HorizontalSpace.xxlarge(),
            SizedBox(
              width: constraints.maxWidth * .55,
              child: TweenAnimationBuilder(
                duration: const Duration(milliseconds: 450),
                tween: Tween<double>(
                  begin: 0,
                  end: stat.base / 100,
                ),
                builder: (context, value, _) => LinearProgressIndicator(
                  backgroundColor: Colors.white30,
                  minHeight: 12,
                  borderRadius: BorderRadius.circular(30),
                  color: color,
                  value: value,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
