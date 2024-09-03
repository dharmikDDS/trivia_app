import 'package:bloc_clean_tdd_demo/core/error/failures.dart';
import 'package:bloc_clean_tdd_demo/features/history/data/models/saved_trivia_model.dart';
import 'package:dartz/dartz.dart';

abstract class SavedTriviasRepo {
  Future<Either<Failure, List<SavedTriviaModel>>> getAllSavedTrivias();

  Either<Failure, void> saveTrivia({
    required int number,
    required String triviaString,
  });
}
