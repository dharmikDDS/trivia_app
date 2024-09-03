import 'dart:developer';

import 'package:bloc_clean_tdd_demo/core/app/consts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveHelper {
  HiveHelper._();

  static final HiveHelper _instance = HiveHelper._();

  static HiveHelper get instance => _instance;

  late final Box _prefsBox;

  late final Box _savedTriviaBox;

  init() async {
    final appDir = await getApplicationDocumentsDirectory();
    Hive.init(appDir.path);
    await Hive.openBox(Consts.prefsBoxKey);
    await Hive.openBox(Consts.savedTriviaBoxKey);
    _prefsBox = Hive.box(Consts.prefsBoxKey);
    _savedTriviaBox = Hive.box(Consts.savedTriviaBoxKey);
  }

  /// TRIVIA

  String? get chachedTrivia => _prefsBox.get(Consts.lastrChahedTriviaKey);

  Future<void> addTrivia({required String triviaString}) =>
      _prefsBox.put(Consts.lastrChahedTriviaKey, triviaString);

  /// Saved Trivias

  Future<void> saveTrivia(
      {required int number, required String triviaString}) async {
    log('_savedTriviaBox.containsKey(number): ${_savedTriviaBox.containsKey(number)}');
    if (_savedTriviaBox.containsKey(number)) {
      log('current Value: ${_savedTriviaBox.toMap()[number]}');
      _savedTriviaBox.put(
        number,
        [..._savedTriviaBox.toMap()[number], triviaString],
      );
      // _savedTriviaBox.toMap()[number] = [
      //   ..._savedTriviaBox.toMap()[number],
      //   triviaString
      // ];
      log('updated Value: ${_savedTriviaBox.toMap()[number]}');
    } else {
      await _savedTriviaBox.put(number, [triviaString]);
      log('saved the new one: ${_savedTriviaBox.get(number)}');
    }
  }

  List<Map<String, dynamic>> getAllTrivias() {
    return _savedTriviaBox
        .toMap()
        .entries
        .map((e) => {'number': e.key, 'trivias': e.value.toString()})
        .toList();
  }
}
