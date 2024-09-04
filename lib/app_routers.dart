import 'package:flutter/material.dart';

import '../data/model/character_model.dart';
import '../presentation/screens/character_details_screen.dart';
import '../presentation/screens/character_screen.dart';
import 'constants/strings.dart';

class AppRouters {
  Route? generateRoute(RouteSettings settings) {
    late final Widget screen;
    switch (settings.name) {
      case characterScreen:
        screen = const CharacterScreen();
        break;
      case characterDetailsScreen:
        screen = CharacterDetailsScreen(
            characters: settings.arguments as CharactersModel);
        break;
      default:
        screen = const Scaffold(
          body: Center(
            child: Text('Wrong Route'),
          ),
        );
        break;
    }
    return MaterialPageRoute(
      builder: (_) => screen,
    );
  }
}
