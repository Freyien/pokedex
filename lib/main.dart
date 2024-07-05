import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/router/router.dart';
import 'package:pokemon/core/ui/theme/pokemon_theme.dart';
import 'package:pokemon/di/di_init.dart';
import 'package:pokemon/features/pokemon_list/ui/bloc/pokemon_list_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  diInit();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PokemonListBloc>()..add(GetPokemonListEvent()),
      child: MaterialApp.router(
        themeMode: ThemeMode.dark,
        theme: PokemonTheme.dark,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
