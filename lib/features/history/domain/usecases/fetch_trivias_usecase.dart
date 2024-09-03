import 'package:bloc_clean_tdd_demo/core/error/failures.dart';
import 'package:bloc_clean_tdd_demo/core/usecases/usecase.dart';
import 'package:bloc_clean_tdd_demo/features/history/data/models/saved_trivia_model.dart';
import 'package:bloc_clean_tdd_demo/features/history/domain/repositories/saved_trivias_repo.dart';
import 'package:dartz/dartz.dart';

class FetchHistoriesUsecase extends UseCase<List<SavedTriviaModel>, NoParams> {
  final SavedTriviasRepo repo;

  FetchHistoriesUsecase(this.repo);

  @override
  Future<Either<Failure, List<SavedTriviaModel>>> call(NoParams params) async {
    return await repo.getAllSavedTrivias();
  }
}
