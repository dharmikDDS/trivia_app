import 'dart:developer';

import 'package:bloc_clean_tdd_demo/core/error/failures.dart';
import 'package:bloc_clean_tdd_demo/features/history/data/datasources/saved_trivias_data_source.dart';
import 'package:bloc_clean_tdd_demo/features/history/data/models/saved_trivia_model.dart';
import 'package:bloc_clean_tdd_demo/features/history/domain/repositories/saved_trivias_repo.dart';
import 'package:dartz/dartz.dart';

class SavedTriviasRepoImpl implements SavedTriviasRepo {
  SavedTriviasRepoImpl({required this.savedTriviasDataSource});

  final SavedTriviasDataSource savedTriviasDataSource;

  @override
  Future<Either<Failure, List<SavedTriviaModel>>> getAllSavedTrivias() async {
    try {
      final resp = await savedTriviasDataSource.getAllTrivias();
      return Right(resp);
    } catch (e, s) {
      log('error whilw getting saved trivia => $e');
      log('error whilw getting saved trivia => $s');
      return const Left(CacheFailure('Something went wrong.'));
    }
  }

  @override
  Either<Failure, void> saveTrivia(
      {required int number, required String triviaString}) {
    try {
      return Right(
        savedTriviasDataSource.saveTrivia(
          number: number,
          triviaString: triviaString,
        ),
      );
    } catch (e, s) {
      log('error whilw saving trivia => $e');
      log('error whilw saving trivia => $s');
      return const Left(CacheFailure('Something went wrong.'));
    }
  }
}
