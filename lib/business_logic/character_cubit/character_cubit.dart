import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../data/repo/character_repo.dart';
import '../../data/model/character_model.dart';
import '../../presentation/widgets/character_search_list.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRepo characterRepo;
  List<CharactersModel> characters = [];
  CharacterCubit(this.characterRepo) : super(CharacterInitial());
  List<CharactersModel> getAllCharacters() {
    characterRepo.getCharacters().then((characters) {
      emit(CharacterLoaded(characters));
    });
    return characters;
  }

  bool isSearching = false;
  List<CharactersModel> searchedCharacters = [];

  void startSearch(BuildContext context) {
    ModalRoute.of(context)!.addLocalHistoryEntry(
      LocalHistoryEntry(
        onRemove: () => stopSearch(),
      ),
    );

    isSearching = true;
    emit(StartSearchState());
  }

  List <CharactersModel> addSearchToList(String searchCharacter) {
    searchedCharacters = allCharacters
        .where((character) => character.name!
            .toLowerCase()
            .contains(searchCharacter.toLowerCase()))
        .toList();
    isSearching = true;
    emit(ListIsSearching(searchList: searchedCharacters));

    return searchedCharacters;
  }

  void stopSearch() {
    isSearching = false;
    clearSearch();
    emit(StopSearchState());
  }

  void clearSearch() {
    isSearching = false;
    searchTextController.clear();
    emit(ClearSearchState());
  }
}
