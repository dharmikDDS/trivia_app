import 'package:bloc_clean_tdd_demo/features/history/data/models/saved_trivia_model.dart';

abstract class HistoryState {}

class LoadingHistoriesState extends HistoryState {}

class FailureHistoriesState extends HistoryState {
  final String err;

  FailureHistoriesState(this.err);
}

class SuccessHistoriesState extends HistoryState {
  final List<SavedTriviaModel> trivias;

  SuccessHistoriesState(this.trivias);
}

class FailureSaveHistoryState extends HistoryState {
  final String err;

  FailureSaveHistoryState(this.err);
}

class SuccessSaveHistoryState extends HistoryState {}
