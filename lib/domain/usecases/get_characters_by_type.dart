import 'package:challenge_marvel_heroes/core/failures/failure.dart';
import 'package:challenge_marvel_heroes/core/usecase/usecase.dart';
import 'package:challenge_marvel_heroes/domain/entities/caracter_type.dart';
import 'package:challenge_marvel_heroes/domain/entities/character.dart';
import 'package:challenge_marvel_heroes/domain/repositories/character_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class GetCharactersByType extends UseCase<List<Character>, CharacterType> {
  final CharacterRepository repository;

  GetCharactersByType({@required this.repository});

  @override
  Future<Either<Failure, List<Character>>> call(CharacterType type) {
    return repository.getCharactersByType(type);
  }
}
