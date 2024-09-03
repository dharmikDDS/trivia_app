import 'package:bloc_clean_tdd_demo/core/app/hive_helper.dart';
import 'package:bloc_clean_tdd_demo/features/history/data/models/saved_trivia_model.dart';

abstract class SavedTriviasDataSource {
  Future<void> saveTrivia({required int number, required String triviaString});
  Future<List<SavedTriviaModel>> getAllTrivias();
}

class SavedTriviasDataSourceImpl implements SavedTriviasDataSource {
  @override
  Future<List<SavedTriviaModel>> getAllTrivias() async {
    final resp = HiveHelper.instance.getAllTrivias();

    return resp.map((e) => SavedTriviaModel.fromJson(e)).toList();
  }

  @override
  Future<void> saveTrivia(
      {required int number, required String triviaString}) async {
    return await HiveHelper.instance.saveTrivia(
      number: number,
      triviaString: triviaString,
    );
  }
}
