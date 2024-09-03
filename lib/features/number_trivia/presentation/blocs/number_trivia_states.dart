import 'package:bloc_clean_tdd_demo/core/error/failures.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaStates {}

class TriviaInitial implements NumberTriviaStates {}

class TriviaLoading implements NumberTriviaStates {}

class TriviaSuccess implements NumberTriviaStates {
  final NumberTrivia triviaModel;

  TriviaSuccess({required this.triviaModel});
}

class TriviaError implements NumberTriviaStates {
  final Failure error;

  TriviaError({required this.error});
}
