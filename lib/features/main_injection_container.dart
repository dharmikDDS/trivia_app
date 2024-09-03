import 'package:bloc_clean_tdd_demo/core/app/base_repository.dart';
import 'package:bloc_clean_tdd_demo/features/history/history_injection_container.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/number_trivia_injection_container.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

abstract class Injector {
  @mustCallSuper
  Future<void> init() async {
    // GetIt.I.registerSingleton<SharedPrefs>(SharedPrefs.instance..init());

    GetIt.I.registerLazySingleton<BaseRepository>(
        () => BaseRepository.instance..initialize());

    GetIt.I.registerLazySingleton<Dio>(() => GetIt.I<BaseRepository>().dio);
  }
}

class Injectioncontainer extends Injector
    with NumberTriviaInjector, HistoryInjector {}
