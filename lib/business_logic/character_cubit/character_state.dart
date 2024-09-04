part of 'character_cubit.dart';

@immutable
sealed class CharacterState {}

final class CharacterInitial extends CharacterState {}

final class CharacterLoading extends CharacterState {}

final class CharacterLoaded extends CharacterState {
  final List<CharactersModel> allCharacters;
  final List<CharactersModel> viewCharacters;

  CharacterLoaded({required this.allCharacters, required this.viewCharacters});
}

final class CharacterError extends CharacterState {
  final String message;
  CharacterError(this.message);
}
