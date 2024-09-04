import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/utils/custom_cubit.dart';

import '../../business_logic/character_cubit/character_cubit.dart';
import '../../constants/colors.dart';
import '../widgets/loaded_list.dart';
import '../widgets/character_search_list.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final FocusNode searchFocusNode = FocusNode();
    return BlocProvider(
      create: (context) => CustomCubit<bool>(false),
      child: Scaffold(
        backgroundColor: ColorsConstants.grey,
        appBar: AppBar(
          backgroundColor: ColorsConstants.yellow,
          leading: BlocBuilder<CustomCubit<bool>, bool>(
            builder: (context, isSearching) {
              if (isSearching) {
                return BackButton(
                    color: ColorsConstants.grey,
                    onPressed: () => CustomCubit.get<bool>(context)
                            .changeState(false, function: () {
                          searchTextController.clear();
                          BlocProvider.of<CharacterCubit>(context)
                              .searchFor('');
                        }));
              } else {
                return const SizedBox();
              }
            },
          ),
          title: BlocBuilder<CustomCubit<bool>, bool>(
            builder: (context, isSearching) {
              if (isSearching) {
                return SearchText(
                  focusNode: searchFocusNode,
                  onChange: (value) {
                    BlocProvider.of<CharacterCubit>(context)
                        .searchFor(value!.trim());
                  },
                );
              } else {
                return const Text(
                  'Movie App',
                  style: TextStyle(
                    color: ColorsConstants.grey,
                  ),
                );
              }
            },
          ),
          actions: [
            BlocBuilder<CustomCubit<bool>, bool>(
              builder: (context, isSearching) {
                if (isSearching) {
                  return IconButton(
                    onPressed: () {
                      CustomCubit.get<bool>(context).changeState(false,
                          function: () {
                        searchTextController.clear();
                        CharacterCubit.get(context).searchFor('');
                      });
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: ColorsConstants.grey,
                    ),
                  );
                } else {
                  return IconButton(
                    onPressed: () {
                      if (CharacterCubit.get(context).state is CharacterError) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text((CharacterCubit.get(context).state
                                    as CharacterError)
                                .message)));
                        return;
                      }
                      CustomCubit.get<bool>(context).changeState(true);
                      searchFocusNode.requestFocus();
                    },
                    icon: const Icon(
                      Icons.search,
                      color: ColorsConstants.grey,
                    ),
                  );
                }
              },
            )
          ],
        ),
        body: BlocBuilder<CharacterCubit, CharacterState>(
          builder: (context, state) {
            if (state is CharacterLoaded) {
              return LoadedList(
                characters: state.viewCharacters,
              );
            } else if (state is CharacterError) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.message,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        CharacterCubit.get(context).getAllCharacters();
                      },
                      child: const Text(
                        'Try again',
                      ))
                ],
              ));
            }
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsConstants.yellow,
              ),
            );
          },
        ),
      ),
    );
  }
}
