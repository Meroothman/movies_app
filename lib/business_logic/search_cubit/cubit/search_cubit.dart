import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../data/model/character_model.dart';
import '../../../presentation/widgets/character_search_list.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
    bool isSearching = false;

    void startSearch() {
  
    isSearching = true;
    emit(StartSearchState());
  }

  void addSearchToList(String searchCharacter) {

    searchedCharacters = allCharacters
        .where((character) => character.name!
            .toLowerCase()
            .contains(searchCharacter.toLowerCase()))
        .toList();
    emit(ListIsSearching(searchList : searchedCharacters ));
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

