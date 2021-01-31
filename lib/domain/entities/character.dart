import 'package:challenge_marvel_heroes/domain/entities/ability.dart';
import 'package:equatable/equatable.dart';

import 'caracteristic.dart';

class Character extends Equatable {
  final String name;
  final String alterEgo;
  final String imagePath;
  final String biography;
  final Caracteristic caracteristics;
  final Ability abilities;
  final List<String> movies;

  const Character(this.name, this.alterEgo, this.imagePath, this.biography, this.caracteristics, this.abilities, this.movies);


  @override
  List<Object> get props => [
    name, alterEgo, caracteristics
  ];
}
