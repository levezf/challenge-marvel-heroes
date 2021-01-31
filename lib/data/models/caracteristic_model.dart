import 'package:challenge_marvel_heroes/domain/entities/caracteristic.dart';

import 'measure_model.dart';

class CaracteristicModel extends Caracteristic {
  const CaracteristicModel({
    String birth,
    HeightModel height,
    WeightModel weight,
    String universe,
  }) : super(
    birth: birth,
    height: height,
    weight: weight,
    universe: universe,
  );

  factory CaracteristicModel.fromJson(Map<String, dynamic> json) {
    return CaracteristicModel(
      birth: json['birth'] as String,
      height: HeightModel.fromJson(json['height'] as Map<String, dynamic>),
      weight: WeightModel.fromJson(json['weight'] as Map<String, dynamic>),
      universe: json['universe'] as String,
    );
  }
}
