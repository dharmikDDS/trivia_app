import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String err;
  const Failure(this.err, [List properties = const <dynamic>[]]);
}

class EmptyFailure extends Failure {
  const EmptyFailure(super.err);

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure(super.err);

  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  const CacheFailure(super.err);

  @override
  List<Object?> get props => [];
}
