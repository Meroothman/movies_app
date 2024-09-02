// import 'package:movies_app/data/services/api_services.dart';

// import '../model/character_model/character_model.dart';

// class CharacterRepo {
//   CharacterRepo(this.apiServices);
//   ApiServices apiServices = ApiServices();
//   Future<List<dynamic>> getAllCharacters() async {
//     try {
//       final characters = await apiServices.getAllCharacters();
//       return characters
//           .map((character) =>
//               CharacterModel.fromJson(character as Map<String, dynamic>))
//           .toList();
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

/*import 'package:movies_app/data/services/api_services.dart';
import '../model/character_model/character_model.dart';

class CharactersRepo {
  final ApiServices apiServices;

  CharactersRepo(this.apiServices);

  Future<List<dynamic>> getCharacters() async {
    try {
      final characters = await apiServices.getAllCharacters();
      return characters
          .map(
            (character) =>
                CharacterModel.fromJson(character as Map<String, dynamic>),
          )
          .toList();

          print(characters .toString() );
          print("results of repo is  okey");
    } catch (e) {
      print(e.toString());
      print("results of repo is  not okey");
      rethrow;
    }
  }
}*/
import 'package:movies_app/data/services/api_services.dart';
import '../model/character_model.dart';

class CharactersRepo {
  final ApiServices apiServices;

  CharactersRepo(this.apiServices);

  Future<List<CharactersModel>> getCharacters() async {
    try {
      final List<CharactersModel> characters = await apiServices.getAllCharacters();
      //print(characters.toString());
      //print("results of repo is ok");
      return characters;
    } catch (e) {
      //print(e.toString());
      //print("results of repo is not ok");
      rethrow;
    }
  }
}
