part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Character> heroes;
  final List<Character> villains;
  final List<Character> antiHeroes;
  final List<Character> aliens;
  final List<Character> humans;

  HomeLoaded({
    @required this.heroes,
    @required this.villains,
    @required this.antiHeroes,
    @required this.aliens,
    @required this.humans,
  });

  @override
  List<Object> get props => [
        heroes,
        villains,
        antiHeroes,
        aliens,
        humans,
      ];
}

class Error extends HomeState {}
