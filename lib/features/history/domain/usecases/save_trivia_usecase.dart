import 'package:bloc_clean_tdd_demo/core/error/failures.dart';
import 'package:bloc_clean_tdd_demo/core/usecases/usecase.dart';
import 'package:bloc_clean_tdd_demo/features/history/data/datasources/saved_trivias_data_source.dart';
import 'package:bloc_clean_tdd_demo/features/history/data/models/saved_trivia_model.dart';
import 'package:bloc_clean_tdd_demo/features/history/domain/repositories/saved_trivias_repo.dart';
import 'package:dartz/dartz.dart';

class SaveTriviaUsecase extends UseCase<void, SaveTriviaParams>{
  final SavedTriviasRepo repo;

  SaveTriviaUsecase(this.repo);
  
  @override
  Future<Either<Failure, void>> call(SaveTriviaParams params) async {
    return repo.saveTrivia(number: params.number, triviaString: params.triviaStr);
  }
}

class SaveTriviaParams {
  final int number;
  final String triviaStr;

  SaveTriviaParams(this.number, this.triviaStr);
}