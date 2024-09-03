import 'package:bloc_clean_tdd_demo/core/error/failures.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      {required int number});

  Future<Either<Failure, NumberTrivia>> getRandomnumberTrivia();
}
