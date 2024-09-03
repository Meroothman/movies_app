import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/character_cubit/character_cubit.dart';
import 'char_item.dart';
import 'character_search_list.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            itemCount: searchTextController.text.isEmpty
                ? allCharacters.length
                : searchedCharacters.length,
            itemBuilder: (context, index) {
              return CharItem(
                characters: searchTextController.text.isEmpty
                    ? allCharacters[index]
                    : searchedCharacters[index],
              );
            },
          );
      },
    );
  }
}