abstract class HistoryEvent {}

class FetchHistoriesEvent extends HistoryEvent {}

class SaveTriviaToHistoryEvent extends HistoryEvent {
  final int number;
  final String triviaStr;

  SaveTriviaToHistoryEvent(this.number, this.triviaStr);
}
