import 'package:challenge_marvel_heroes/core/failures/failure.dart';
import 'package:dartz/dartz.dart';


abstract class UseCase<R, P> {
  
  Future<Either<Failure, R>> call(P param);

}