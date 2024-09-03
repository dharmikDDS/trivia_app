import 'package:bloc_clean_tdd_demo/core/error/failures.dart';
import 'package:bloc_clean_tdd_demo/core/usecases/usecase.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/domain/repositories/number_trivia_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetConcreteTriviaUseCase
    extends UseCase<NumberTrivia, ConcreteNumberParams> {
  GetConcreteTriviaUseCase(this.repository);

  final NumberTriviaRepository repository;

  @override
  Future<Either<Failure, NumberTrivia>> call(params) async {
    return await repository.getConcreteNumberTrivia(number: params.number);
  }
}

class ConcreteNumberParams extends Equatable {
  const ConcreteNumberParams({required this.number});

  final int number;

  @override
  List<Object?> get props => [number];
}
