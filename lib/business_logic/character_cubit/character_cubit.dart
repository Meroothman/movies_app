import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/character_repo.dart';
import '../../data/model/character_model.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRepo characterRepo;

  CharacterCubit(this.characterRepo) : super(CharacterInitial());

  static CharacterCubit get(context) =>
      BlocProvider.of<CharacterCubit>(context);

  Future<void> getAllCharacters() async {
    emit(CharacterLoading());
    try {
      final data = await characterRepo.getCharacters();
      emit(CharacterLoaded(allCharacters: data, viewCharacters: data));
    } catch (e) {
      emit(CharacterError(e.toString()));
    }
  }

  Future<void> searchFor(String searchValue) async {
    List<CharactersModel> allCharacters =
        (state as CharacterLoaded).allCharacters;
    emit(CharacterLoading());
    try {
      List<CharactersModel> viewCharacters = allCharacters
          .where(
              (e) => e.name!.toLowerCase().contains(searchValue.toLowerCase()))
          .toList();
      emit(CharacterLoaded(
          allCharacters: allCharacters, viewCharacters: viewCharacters));
    } catch (e) {
      emit(CharacterError(e.toString()));
    }
  }
}
