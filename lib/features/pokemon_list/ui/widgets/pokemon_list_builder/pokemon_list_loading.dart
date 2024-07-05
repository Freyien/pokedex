import 'package:flutter/material.dart';
import 'package:pokemon/core/ui/widgets/vertical_space.dart';
import 'package:shimmer/shimmer.dart';

class PokemonListLoading extends StatelessWidget {
  const PokemonListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 40),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey[800]!,
              ),
              child: Shimmer.fromColors(
                baseColor: Colors.black26,
                highlightColor: Colors.black38,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    VerticalSpace.small(),
                    Container(
                      height: 16,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          childCount: 100,
        ),
      ),
    );
  }
}
