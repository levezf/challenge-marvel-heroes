import 'package:challenge_marvel_heroes/domain/entities/measure.dart';
import 'package:equatable/equatable.dart';

class Caracteristic extends Equatable {
  final String birth;
  final Height height;
  final Weight weight;
  final String universe;

  const Caracteristic({this.birth, this.height, this.weight, this.universe});

  String get formattedAge =>  '${DateTime.now().year - int.parse(birth)} anos';
  String get formattedHeight => '${height.value.toStringAsFixed(2)}m';
  String get formattedWeight => '${weight.value.truncate()}kg';

  @override
  List<Object> get props => [birth, height, weight, universe];
}
