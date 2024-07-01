import 'package:elemental_game/arena/arena_bloc/arena_bloc.dart';
import 'package:elemental_game/arena/arena_screen.dart';
import 'package:elemental_game/arena/character_select_screen.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Alkhemikal'
      ),
      builder: (context, child) => MultiBlocProvider(
          providers: [
            BlocProvider<ArenaBloc>(
              create: (context) => ArenaBloc()
                ..add(Init()),
            ),
          ],
          child: BlocListener<ArenaBloc, ArenaState>(
            listener: (context, state) {

            },
            child: child,
          ),
        ),
      home: CharacterSelectScreen(),
    );
  }
}
