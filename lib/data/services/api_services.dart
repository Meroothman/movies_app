import 'dart:developer';

import 'package:dio/dio.dart';

import '../../constants/strings.dart';
import '../model/character_model.dart';
import 'errors/exceptions.dart';
import 'status_code.dart';

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
      List<CharactersModel> characters = results
          .map((character) =>
              CharactersModel.fromJson(character as Map<String, dynamic>))
          .toList();
      //print(characters.toString());
      //print("results done");
      return characters; // Return the List<CharacterModel>
    } on DioException catch (e) {
      throw _handelDioError(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  dynamic _handelDioError(DioException error) {
    log(error.toString());
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw BadRequestException(error.response!.data['message']);
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw UnauthorizedException(error.response!.data['status_message']);
          case StatusCode.notFound:
            throw NotFoundException(error.response!.data['message']);
          case StatusCode.conflict:
            throw const ConflictException(/*error.response!.data['message']*/);
          case StatusCode.internalServer:
            throw InternalServerErrorException(error.response!.data['message']);
          default:
            throw ServerException(error.response!.data['message']);
        }
      case DioExceptionType.cancel:
        throw const ServerException('Canceled');

      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        throw const NoInternetConnectionException();
      default:
        return null;
    }
  }
}
