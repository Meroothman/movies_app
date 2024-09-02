import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/repo/character_repo.dart';

import '../../data/model/character_model.dart';


part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRepo characterRepo;
  List<CharactersModel> characters = [];

  CharacterCubit(this.characterRepo) : super(CharacterInitial());
  List<CharactersModel> getAllCharacters() {
    characterRepo.getCharacters().then((characters) {
      //print(characters);
    
      emit(CharacterLoaded(characters));
    });
    return characters;
  }
}


