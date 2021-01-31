import 'package:challenge_marvel_heroes/domain/entities/measure.dart';

class WeightModel extends Weight {
  const WeightModel(double value, String unity) : super(value, unity);

  factory WeightModel.fromJson(Map<String, dynamic> json) {
    return WeightModel(
      (json['value'] as num).toDouble(),
      json['unity'] as String,
    );
  }
}

class HeightModel extends Height {
  const HeightModel(double value, String unity) : super(value, unity);

  factory HeightModel.fromJson(Map<String, dynamic> json) {
    return HeightModel(
      (json['value'] as num).toDouble(),
      json['unity'] as String,
    );
  }
}
