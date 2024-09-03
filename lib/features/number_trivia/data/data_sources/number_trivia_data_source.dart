import 'package:bloc_clean_tdd_demo/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:dio/dio.dart';

abstract class NumberTiviaDataSourceRemote {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);
  Future<NumberTriviaModel> getRandomTrivia();
}

class NumberTriviaDataSourceRemoteImpl implements NumberTiviaDataSourceRemote {
  final Dio dio;

  NumberTriviaDataSourceRemoteImpl({required this.dio});

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async {
    final resp = await dio.get('/$number');
    final model = NumberTriviaModel.fromJson(resp.data);
    return model;
  }

  @override
  Future<NumberTriviaModel> getRandomTrivia() async {
    final resp = await dio.get('/random/trivia');
    final model = NumberTriviaModel.fromJson(resp.data);
    return model;
  }
}
