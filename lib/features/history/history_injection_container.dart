import 'package:bloc_clean_tdd_demo/features/history/data/datasources/saved_trivias_data_source.dart';
import 'package:bloc_clean_tdd_demo/features/history/data/repository/saved_trivias_repo_impl.dart';
import 'package:bloc_clean_tdd_demo/features/history/domain/repositories/saved_trivias_repo.dart';
import 'package:bloc_clean_tdd_demo/features/history/domain/usecases/fetch_trivias_usecase.dart';
import 'package:bloc_clean_tdd_demo/features/history/domain/usecases/save_trivia_usecase.dart';
import 'package:bloc_clean_tdd_demo/features/history/presentation/blocs/history_bloc.dart';
import 'package:bloc_clean_tdd_demo/features/main_injection_container.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

mixin HistoryInjector on Injector {
  @mustCallSuper
  @override
  Future<void> init() async {
    super.init();

    /// Blocs
    GetIt.I.registerLazySingleton<HistoryBloc>(
      () => HistoryBloc(
        getTriviaUsecase: GetIt.I(),
        saveTriviaUsecase: GetIt.I(),
      ),
    );

    /// Use cases
    GetIt.I.registerLazySingleton<SaveTriviaUsecase>(
      () => SaveTriviaUsecase(GetIt.I()),
    );

    GetIt.I.registerLazySingleton<FetchHistoriesUsecase>(
      () => FetchHistoriesUsecase(GetIt.I()),
    );

    /// Repositories
    GetIt.I.registerLazySingleton<SavedTriviasRepo>(
      () => SavedTriviasRepoImpl(savedTriviasDataSource: GetIt.I()),
    );

    /// Data source
    GetIt.I.registerLazySingleton<SavedTriviasDataSource>(
      () => SavedTriviasDataSourceImpl(),
    );
  }
}
