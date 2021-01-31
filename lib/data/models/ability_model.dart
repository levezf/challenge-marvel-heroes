import 'package:challenge_marvel_heroes/domain/entities/ability.dart';

class AbilityModel extends Ability {
  const AbilityModel({
    double force,
    double intelligence,
    double agility,
    double endurance,
    double velocity,
  }) : super(
          force: force,
          intelligence: intelligence,
          agility: agility,
          endurance: endurance,
          velocity: velocity,
        );

  factory AbilityModel.fromJson(Map<String, dynamic> json) {
    return AbilityModel(
      force: (json['force'] as num).toDouble(),
      intelligence: (json['intelligence'] as num).toDouble(),
      agility: (json['agility'] as num).toDouble(),
      endurance: (json['endurance'] as num).toDouble(),
      velocity: (json['velocity'] as num).toDouble(),
    );
  }
}
