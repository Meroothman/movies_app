import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../widgets/build_loaded_list.dart';
import '../../business_logic/search_cubit/cubit/search_cubit.dart';
import '../../constants/colors.dart';
import '../../business_logic/character_cubit/character_cubit.dart';
import '../widgets/build_appbar_tittle.dart';
import '../widgets/character_search_list.dart';

class CharacterScreen extends StatelessWidget {
  
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<SearchCubit>(context);
    final characterCubit = BlocProvider.of<CharacterCubit>(context);
    return Scaffold(
      backgroundColor: ColorsConstants.grey,
      appBar: AppBar(
        backgroundColor: ColorsConstants.yellow,
        leading: searchCubit.isSearching
            ? const BackButton(color: ColorsConstants.grey)
            : null,
        title: searchCubit.isSearching
            ? const BuildSearchText()
            : const BuildAppBarTittle(),
        actions: searchCubit.isSearching
            ? [
                IconButton(
                  onPressed: () {
                    searchCubit.clearSearch();
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: ColorsConstants.grey,
                  ),
                ),
              ]
            : [
                IconButton(
                  onPressed: () {
                    searchCubit.startSearch();
                    ModalRoute.of(context)!.addLocalHistoryEntry(
                      LocalHistoryEntry(
                        onRemove: searchCubit.stopSearch,
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.search,
                    color: ColorsConstants.grey,
                  ),
                ),
              ],
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          List<ConnectivityResult> connectivity,
          Widget child,
        ) {
          final bool connected =
              !connectivity.contains(ConnectivityResult.none);
          if (connected) {
            return BlocBuilder<CharacterCubit, CharacterState>(
              builder: (context, state) {
                characterCubit.getAllCharacters();
                if (state is CharacterLoaded) {
                  searchedCharacters = state.characters;
                  allCharacters = state.characters;
                  return const BuildLoadedList();
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorsConstants.yellow,
                    ),
                  );
                }
              },
            );
          } else {
            return const Center(
              child: Text("Not Connected"),
            );
          }
        },
        child: BlocBuilder<CharacterCubit, CharacterState>(
          builder: (context, state) {
            if (state is CharacterLoaded) {
              allCharacters = state.characters;
              return const BuildLoadedList();
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsConstants.yellow,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
