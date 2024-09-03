import 'package:bloc_clean_tdd_demo/core/platform/network_info.dart';
import 'package:bloc_clean_tdd_demo/features/main_injection_container.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/data/data_sources/number_trivia_data_source.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/data/data_sources/number_trivia_local_data_source.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/data/repositories/number_trivia_repo_impl.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/domain/repositories/number_trivia_repo.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/domain/usecases/get_random_trivia.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/presentation/blocs/number_trivia_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

mixin NumberTriviaInjector on Injector {
  @mustCallSuper
  @override
  Future<void> init() async {
    super.init();

    /// Blocs
    GetIt.I.registerLazySingleton(
      () => NumberTriviaBloc(
        concreteNumberTriviaUseCase: GetIt.I<GetConcreteTriviaUseCase>(),
        randomTriviaUseCase: GetIt.I<GetRandomTriviaUseCase>(),
      ),
    );

    /// Use cases
    GetIt.I.registerLazySingleton(
      () => GetConcreteTriviaUseCase(
        GetIt.I<NumberTriviaRepository>(),
      ),
    );
    GetIt.I.registerLazySingleton(
      () => GetRandomTriviaUseCase(
        GetIt.I<NumberTriviaRepository>(),
      ),
    );

    /// Repositories
    GetIt.I.registerLazySingleton<NumberTriviaRepository>(
      () => NumberTriviaRepositoryImpl(
        localDataSource: GetIt.I<NumbersTriviaDataSourceLocal>(),
        remoteDataSource: GetIt.I<NumberTiviaDataSourceRemote>(),
        networkinfo: GetIt.I<NetworkInfo>(),
      ),
    );

    /// Data sources
    GetIt.I.registerLazySingleton<NumberTiviaDataSourceRemote>(
      () => NumberTriviaDataSourceRemoteImpl(
        dio: GetIt.I<Dio>(),
      ),
    );

    GetIt.I.registerLazySingleton<NumbersTriviaDataSourceLocal>(
      () => NumbersTriviaDataSourceLocalImpl(),
    );

    GetIt.I.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(),
    );
  }
}
