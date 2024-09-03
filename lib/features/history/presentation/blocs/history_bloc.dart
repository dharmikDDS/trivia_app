import 'dart:async';
import 'dart:developer';

import 'package:bloc_clean_tdd_demo/core/usecases/usecase.dart';
import 'package:bloc_clean_tdd_demo/features/history/domain/usecases/fetch_trivias_usecase.dart';
import 'package:bloc_clean_tdd_demo/features/history/domain/usecases/save_trivia_usecase.dart';
import 'package:bloc_clean_tdd_demo/features/history/presentation/blocs/history_events.dart';
import 'package:bloc_clean_tdd_demo/features/history/presentation/blocs/history_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final SaveTriviaUsecase saveTriviaUsecase;
  final FetchHistoriesUsecase getTriviaUsecase;

  HistoryBloc({
    required this.saveTriviaUsecase,
    required this.getTriviaUsecase,
  }) : super(LoadingHistoriesState()) {
    on<FetchHistoriesEvent>(_fetchHistories);
    on<SaveTriviaToHistoryEvent>(_saveToHistory);
  }

  FutureOr<void> _fetchHistories(
      FetchHistoriesEvent event, Emitter<HistoryState> emit) async {
    log('event added =. FetchHistoriesScreen');
    emit(LoadingHistoriesState());
    try {
      final result = await getTriviaUsecase.call(NoParams());
      log('result - fetch history => $result');
      emit(result.fold(
        (l) => FailureHistoriesState(l.err),
        (r) => SuccessHistoriesState(r),
      ));
    } catch (e, s) {
      log('error while fetching histories - bloc => $e');
      log('error while fetching histories - bloc => $s');
      emit(FailureHistoriesState('Something went wrong.'));
    }
  }

  FutureOr<void> _saveToHistory(
      SaveTriviaToHistoryEvent event, Emitter<HistoryState> emit) async {
    try {
      emit(LoadingHistoriesState());
      final result = await saveTriviaUsecase.call(
        SaveTriviaParams(event.number, event.triviaStr),
      );
      emit(result.fold(
        (l) => FailureSaveHistoryState(l.err),
        (r) => SuccessSaveHistoryState(),
      ));
    } catch (e, s) {
      log('error while fetching histories - bloc => $e');
      log('error while fetching histories - bloc => $s');
      emit(FailureHistoriesState('Something went wrong.'));
    }
  }
}
