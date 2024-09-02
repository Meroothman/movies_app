import 'package:dio/dio.dart';

import '../../constants/strings.dart';
import '../model/character_model.dart';

class ApiServices {
  Dio dio = Dio();

  ApiServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<CharactersModel>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      List<dynamic> results = response.data['results'];
      // Convert the list of dynamic objects to a list of CharacterModel objects
      List<CharactersModel> characters = 
      results.map((character) =>CharactersModel.fromJson(character as Map<String, dynamic>)).toList();
      //print(characters.toString());
      //print("results done");
      return characters; // Return the List<CharacterModel>
    } catch (e) {
      //print(e.toString());
      return []; // Return an empty list in case of error
    }
  }
}
