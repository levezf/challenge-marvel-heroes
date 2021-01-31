import 'dart:convert';

import 'package:challenge_marvel_heroes/core/exception/exception.dart';
import 'package:challenge_marvel_heroes/data/models/character_model.dart';
import 'package:challenge_marvel_heroes/domain/entities/caracter_type.dart';
import 'package:flutter/services.dart' show rootBundle;

abstract class LocalFileDataSource {
  /// Return all caracteres by a [CharacterType].
  ///
  /// Throws an [DataSourceException]  if the data cannot be retrieved correctly.
  Future<List<CharacterModel>> getCharactersByType(CharacterType type);
}

const applicationFileData = 'assets/application.json';

class LocalFileDataSourceImpl implements LocalFileDataSource {
  @override
  Future<List<CharacterModel>> getCharactersByType(CharacterType type) async {
    final jsonComplete =
        jsonDecode(await rootBundle.loadString(applicationFileData));

    if (jsonComplete == null) {
      throw DataSourceException();
    }

    final jsonByType = jsonComplete[type.name()];

    if (jsonByType == null) {
      throw DataSourceException();
    }

    final List<CharacterModel> characteresByType = [];

    for (final characterJson in jsonByType) {
      characteresByType.add(CharacterModel.fromJson(characterJson as Map<String, dynamic>));
    }

    return characteresByType;
  }
}
