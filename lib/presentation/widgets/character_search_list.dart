import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/search_cubit/cubit/search_cubit.dart';
import '../../constants/colors.dart';
import '../../data/model/character_model.dart';


late List<CharactersModel> searchedCharacters;
late List<CharactersModel> allCharacters;
final searchTextController = TextEditingController();
class BuildSearchText extends StatelessWidget {
  const BuildSearchText({super.key});

  @override
  Widget build(BuildContext context) {
 
    return BlocBuilder<SearchCubit, SearchState>(
      // listener: (context, state) {
      //   if (state is ListIsSearching ) {
      //     searchedCharacters = state.searchList;
      //     print("Search list is ok");
      //   }
      //   else if (state is ClearSearchState) {
      //     searchTextController.clear();
      //     print("else if is working");
      //   }
      //   else{
      //     searchedCharacters = allCharacters;
      //   }
        
      // },
      builder: (context, state) {
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
              BlocProvider.of<SearchCubit>(context).addSearchToList(searchCharacter);
            },
          ),
        );
      },
    );
  }
}
