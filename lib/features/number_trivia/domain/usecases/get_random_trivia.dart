import 'package:bloc_clean_tdd_demo/core/error/failures.dart';
import 'package:bloc_clean_tdd_demo/core/usecases/usecase.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/domain/repositories/number_trivia_repo.dart';
import 'package:dartz/dartz.dart';

class GetRandomTriviaUseCase extends UseCase<NumberTrivia, NoParams> {
  GetRandomTriviaUseCase(this.repository);

  final NumberTriviaRepository repository;

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandomnumberTrivia();
  }
}
