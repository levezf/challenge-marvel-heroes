import 'package:challenge_marvel_heroes/domain/entities/character.dart';
import 'ability_model.dart';
import 'caracteristic_model.dart';

class CharacterModel extends Character {
  const CharacterModel(
      String name,
      String alterEgo,
      String imagePath,
      String biography,
      CaracteristicModel caracteristics,
      AbilityModel abilities,
      List<String> movies)
      : super(
          name,
          alterEgo,
          imagePath,
          biography,
          caracteristics,
          abilities,
          movies,
        );

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    final List<String> movies = [];

    for (final movie in json['movies'] as List<dynamic>) {
      movies.add(movie as String);
    }

    return CharacterModel(
      json['name'] as String,
      json['alterEgo'] as String,
      json['imagePath'] as String,
      json['biography'] as String,
      CaracteristicModel.fromJson(json['caracteristics'] as Map<String, dynamic>),
      AbilityModel.fromJson(json['abilities'] as Map<String, dynamic>),
      movies,
    );
  }
}
