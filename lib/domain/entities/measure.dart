import 'package:equatable/equatable.dart';

abstract class Measure extends Equatable {
  final String unity;
  final double value;

  const Measure(this.value, this.unity);

  @override
  List<Object> get props => [unity, value];
}


class Weight extends Measure {
  const Weight(double value, String unity) : super(value, unity);
}

class Height extends Measure {
  const Height(double value, String unity) : super(value, unity);
}
