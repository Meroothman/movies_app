import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_routers.dart';
import 'business_logic/character_cubit/character_cubit.dart';
import 'data/repo/character_repo.dart';
import 'data/services/api_services.dart';


void main() {
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  MovieApp({super.key});

  final AppRouters appRouters = AppRouters();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
          create: (context) => CharacterCubit(CharactersRepo(ApiServices())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouters.generateRoute,
      ),
    );
  }
}
