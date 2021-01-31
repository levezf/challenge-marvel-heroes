import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:challenge_marvel_heroes/core/failures/failure.dart';
import 'package:challenge_marvel_heroes/domain/entities/caracter_type.dart';
import 'package:challenge_marvel_heroes/domain/entities/character.dart';
import 'package:challenge_marvel_heroes/domain/usecases/get_characters_by_type.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCharactersByType getCharactersByType;

  HomeBloc({@required this.getCharactersByType}) : super(null);

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    yield* _handlerGetAllCharactersEvent();
  }

  Stream<HomeState> _handlerGetAllCharactersEvent() async* {
    yield HomeLoading();

    final Map<CharacterType, List<Character>> characteres = {};

    for (final type in CharacterType.values) {
      final Either<Failure, List<Character>> characteresByType =
          await getCharactersByType(type);

      if (characteresByType.isRight()) {
        characteres.putIfAbsent(
            type, () => characteresByType.getOrElse(() => null));
      }
    }

    yield HomeLoaded(
      heroes: characteres[CharacterType.heroes],
      villains: characteres[CharacterType.villains],
      antiHeroes: characteres[CharacterType.antiHeroes],
      aliens: characteres[CharacterType.aliens],
      humans: characteres[CharacterType.humans],
    );
  }
}
