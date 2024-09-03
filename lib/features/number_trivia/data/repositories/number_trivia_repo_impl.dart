import 'dart:developer';
import 'package:bloc_clean_tdd_demo/core/error/failures.dart';
import 'package:bloc_clean_tdd_demo/core/platform/network_info.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/data/data_sources/number_trivia_data_source.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/data/data_sources/number_trivia_local_data_source.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:bloc_clean_tdd_demo/features/number_trivia/domain/repositories/number_trivia_repo.dart';
import 'package:dartz/dartz.dart';

class NumberTriviaRepositoryImpl extends NumberTriviaRepository {
  NumberTriviaRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkinfo,
  });

  final NumberTiviaDataSourceRemote remoteDataSource;
  final NumbersTriviaDataSourceLocal localDataSource;
  final NetworkInfo networkinfo;

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      {required int number}) async {
    try {
      if (await networkinfo.isConnected) {
        final trivia = await remoteDataSource.getConcreteNumberTrivia(number);
        localDataSource.addTriviaToCache(trivia);
        return Right(trivia);
      } else {
        return Right(await localDataSource.getLastTrivia());
      }
    } catch (e, s) {
      log('error while get concrete trivia: $e');
      log('error while get concrete trivia: $s');
      return const Left(ServerFailure('something went wrong.'));
    }
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomnumberTrivia() async {
    try {
      if (await networkinfo.isConnected) {
        final trivia = await remoteDataSource.getRandomTrivia();
        localDataSource.addTriviaToCache(trivia);
        return Right(trivia);
      } else {
        return Right(await localDataSource.getLastTrivia());
      }
    } catch (e, s) {
      log('error while get random trivia: $e');
      log('error while get random trivia: $s');
      return const Left(ServerFailure('something went wrong.'));
    }
  }
}
