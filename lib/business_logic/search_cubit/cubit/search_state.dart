part of 'search_cubit.dart';


@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class StartSearchState extends SearchState {}

final class ListIsSearching extends SearchState { 
  final List<CharactersModel> searchList;
  ListIsSearching({required this.searchList});
}

final class StopSearchState extends SearchState {}

final class ClearSearchState extends SearchState {}

