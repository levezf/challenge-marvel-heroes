import 'package:challenge_marvel_heroes/core/failures/failure.dart';
import 'package:challenge_marvel_heroes/domain/entities/caracter_type.dart';
import 'package:challenge_marvel_heroes/domain/entities/character.dart';
import 'package:dartz/dartz.dart';

abstract class CharacterRepository {


  /// Return an list of [Character] in the right side if no errors.
  /// 
  /// Return a [Failure] in the left side if any error.
  Future<Either<Failure, List<Character>>> getCharactersByType(CharacterType type);
}