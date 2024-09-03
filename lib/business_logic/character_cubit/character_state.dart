part of 'character_cubit.dart';


@immutable
sealed class CharacterState {}

final class CharacterInitial extends CharacterState {}

final class CharacterLoading extends CharacterState {}

final class CharacterLoaded extends CharacterState {
  final List<CharactersModel> characters;
  CharacterLoaded(this.characters);
}

final class CharacterError extends CharacterState {
  final String message;
  CharacterError(this.message);
}
final class StartSearchState extends CharacterState {}

final class ListIsSearching extends CharacterState { 
  final List<CharactersModel> searchList;
  ListIsSearching({required this.searchList});
}

final class StopSearchState extends CharacterState {}

final class ClearSearchState extends CharacterState {}



