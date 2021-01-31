import 'package:equatable/equatable.dart';

class Ability extends Equatable {
  final double force;
  final double intelligence;
  final double agility;
  final double endurance;
  final double velocity;

  const Ability(
      {this.force,
      this.intelligence,
      this.agility,
      this.endurance,
      this.velocity});

  @override
  List<Object> get props => [force, intelligence, agility, endurance, velocity];
}
