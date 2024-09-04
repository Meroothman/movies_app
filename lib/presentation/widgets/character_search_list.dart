import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/character_cubit/character_cubit.dart';
import '../../constants/colors.dart';
import '../../data/model/character_model.dart';


late List<CharactersModel> searchedCharacters;
late List<CharactersModel> allCharacters;
final searchTextController = TextEditingController();
class SearchText extends StatelessWidget {
  const SearchText({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            color: ColorsConstants.yellow,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: searchTextController,
            cursorColor: ColorsConstants.grey,
            decoration: const InputDecoration(
              hintText: 'Find your character',
              border: InputBorder.none,
              hintStyle: TextStyle(
                color: ColorsConstants.grey,
              ),
            ),
            onChanged: (searchCharacter) {
              BlocProvider.of<CharacterCubit>(context).addSearchToList(searchCharacter);
            },
          ),
        );
  }
}
