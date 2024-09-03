// import 'package:bloc_clean_tdd_demo/core/app/consts.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPrefs {
//   SharedPrefs._();

//   static final instance = SharedPrefs._();

//   late final SharedPreferences _prefs;

//   init() async {
//     _prefs = await SharedPreferences.getInstance();
//   }

//   /// TOKEN
//   String? get token => _prefs.getString(Consts.tokenKey);

//   Future<void> addToken({required String token}) =>
//       _prefs.setString(Consts.tokenKey, token);

//   Future<void> removeToken() => _prefs.remove(Consts.tokenKey);

//   /// TRIVIA

//   String? get chachedTrivia => _prefs.getString(Consts.lastrChahedTriviaKey);

//   Future<void> addTrivia({required String triviaString}) =>
//       _prefs.setString(Consts.lastrChahedTriviaKey, triviaString);
// }
