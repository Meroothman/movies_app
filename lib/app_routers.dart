import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business_logic/character_cubit/character_cubit.dart';
import '../data/model/character_model.dart';
import '../data/repo/character_repo.dart';
import '../data/services/api_services.dart';
import '../presentation/screens/character_details_screen.dart';
import '../presentation/screens/character_screen.dart';
import 'constants/strings.dart';

class AppRouters {
  late CharactersRepo characterRepo;
  late CharacterCubit characterCubit;

  AppRouters() {
    characterRepo = CharactersRepo(ApiServices());
    characterCubit = CharacterCubit(characterRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => CharacterCubit(characterRepo),
            child:  const CharacterScreen(),
          ),
        );

      case characterDetailsScreen:
        final character = settings.arguments as CharactersModel;
        return MaterialPageRoute(
            builder: (_) =>  CharacterDetailsScreen(character, characters: character));
    }
    return null;
  }
}
