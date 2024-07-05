import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/pokemon_list/ui/bloc/pokemon_list_bloc.dart';

class PokemonListInfiniteScroll extends StatefulWidget {
  const PokemonListInfiniteScroll({super.key, required this.slivers});

  final List<Widget> slivers;

  @override
  State<PokemonListInfiniteScroll> createState() => _HomeInfiniteScrollState();
}

class _HomeInfiniteScrollState extends State<PokemonListInfiniteScroll>
    with SingleTickerProviderStateMixin {
  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.addListener(_loadMore);
    });

    super.initState();
  }

  void _loadMore() {
    final scrollPosition = controller.position;
    final currentPosition = scrollPosition.pixels;
    final maxPosition = scrollPosition.maxScrollExtent * .8;

    if (currentPosition < maxPosition) return;

    controller.removeListener(_loadMore);
    context.read<PokemonListBloc>().add(GetMorePokemonListEvent());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PokemonListBloc, PokemonListState>(
      listenWhen: (p, c) => p.isLoadingMore != c.isLoadingMore,
      listener: (context, state) async {
        if (state.isLoadingMore) return;

        await Future.delayed(const Duration(milliseconds: 500));
        controller.addListener(_loadMore);
      },
      child: RefreshIndicator.adaptive(
        onRefresh: () async {
          context.read<PokemonListBloc>().add(GetPokemonListEvent());
        },
        color: Colors.white,
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          controller: controller,
          slivers: widget.slivers,
        ),
      ),
    );
  }
}
