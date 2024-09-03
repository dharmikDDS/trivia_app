import 'dart:convert';
import 'dart:developer';
import 'package:bloc_clean_tdd_demo/core/app/hive_helper.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumbersTriviaDataSourceLocal {
  Future<NumberTriviaModel> getLastTrivia();
  Future<void> addTriviaToCache(NumberTriviaModel trivia);
}

class NumbersTriviaDataSourceLocalImpl implements NumbersTriviaDataSourceLocal {
  @override
  Future<void> addTriviaToCache(NumberTriviaModel trivia) async {
    try {
      HiveHelper.instance.addTrivia(triviaString: jsonEncode(trivia.toJson()));
    } catch (e) {
      log('error while saving trivia to local: $e');
    }
  }

  @override
  Future<NumberTriviaModel> getLastTrivia() async {
    final resp = HiveHelper.instance.chachedTrivia;
    final model = NumberTriviaModel.fromJson(jsonDecode(resp ?? ''));
    return model;
  }
}
