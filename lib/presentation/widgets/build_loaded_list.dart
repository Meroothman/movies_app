import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/character_cubit/character_cubit.dart';
import '../../constants/colors.dart';
import 'build_character_list.dart';

class BuildLoadedList extends StatelessWidget {
  const BuildLoadedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: ColorsConstants.grey,
            child: BlocBuilder<CharacterCubit, CharacterState>(
              builder: (context, state) {
                return const Column(
                  children: [
                    BuildCharactersList(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}