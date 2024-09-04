import 'package:flutter/material.dart';
import 'package:movies_app/data/model/character_model.dart';
import '../../constants/colors.dart';
import 'char_item.dart';

class LoadedList extends StatelessWidget {
  const LoadedList({
    super.key,
    required this.characters,
  });

  final List<CharactersModel> characters;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsConstants.grey,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return CharItem(
            characters: characters[index],
          );
        },
      ),
    );
  }
}
