import 'package:bloc_clean_tdd_demo/features/history/domain/entities/saved_trivia.dart';

class SavedTriviaModel extends SavedTrivia {
  const SavedTriviaModel({required super.number, required super.trivias});

  factory SavedTriviaModel.fromJson(Map<String, dynamic> json) {
    return SavedTriviaModel(
      number: json['number'],
      trivias: json['trivias'] != null
          ? ((json['trivias']) as List).map((e) => e.toString()).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        'number': number,
        'trivias': trivias,
      };
}
