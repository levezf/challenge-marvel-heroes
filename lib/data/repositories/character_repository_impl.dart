import 'package:challenge_marvel_heroes/core/exception/exception.dart';
import 'package:challenge_marvel_heroes/data/datasource/local_file_data_source.dart';
import 'package:challenge_marvel_heroes/domain/entities/character.dart';
import 'package:challenge_marvel_heroes/domain/entities/caracter_type.dart';
import 'package:challenge_marvel_heroes/core/failures/failure.dart';
import 'package:challenge_marvel_heroes/domain/repositories/character_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final LocalFileDataSource localFileDataSource;

  CharacterRepositoryImpl({@required this.localFileDataSource});

  @override
  Future<Either<Failure, List<Character>>> getCharactersByType(
      CharacterType type) async {
    try {
      return Right(await localFileDataSource.getCharactersByType(type));
    } on DataSourceException {
      return Left(Failure());
    }
  }
}
