abstract class NumberTriviaEvents {}

class GetConcreteTriviaEvent implements NumberTriviaEvents {
  final int number;

  GetConcreteTriviaEvent({required this.number});
}

class GetRandomTriviaEvent implements NumberTriviaEvents {}
