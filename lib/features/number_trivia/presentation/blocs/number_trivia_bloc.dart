import 'package:bloc_clean_tdd_demo/core/usecases/usecase.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/domain/usecases/get_random_trivia.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/presentation/blocs/number_trivia_events.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/presentation/blocs/number_trivia_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvents, NumberTriviaStates> {
  NumberTriviaBloc({
    required this.concreteNumberTriviaUseCase,
    required this.randomTriviaUseCase,
  }) : super(TriviaInitial()) {
    on<GetConcreteTriviaEvent>(getConcreteTrivia);
    on<GetRandomTriviaEvent>(getRandomTrivia);
  }

  late final GetConcreteTriviaUseCase concreteNumberTriviaUseCase;
  late final GetRandomTriviaUseCase randomTriviaUseCase;

  void getConcreteTrivia(
      NumberTriviaEvents event, Emitter<NumberTriviaStates> emit) async {
    emit(TriviaLoading());
    final result = await concreteNumberTriviaUseCase(
      ConcreteNumberParams(number: (event as GetConcreteTriviaEvent).number),
    );
    emit(
      result.fold(
        (l) => TriviaError(error: l),
        (r) => TriviaSuccess(triviaModel: r),
      ),
    );
  }

  void getRandomTrivia(
      NumberTriviaEvents event, Emitter<NumberTriviaStates> emit) async {
    emit(TriviaLoading());
    final result = await randomTriviaUseCase(NoParams());
    emit(
      result.fold(
        (l) => TriviaError(error: l),
        (r) => TriviaSuccess(triviaModel: r),
      ),
    );
  }
}
