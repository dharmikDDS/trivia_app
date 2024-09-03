import 'package:equatable/equatable.dart';

class SavedTrivia extends Equatable {
  final int number;
  final List<String> trivias;

  const SavedTrivia({
    required this.number,
    required this.trivias,
  });

  @override
  List<Object?> get props => [];
}
