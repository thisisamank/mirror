// To parse this JSON data, do
//
//     final results = resultsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Results {
  Results({
    required this.expression,
    required this.geatures,
    required this.misspelledWords,
    required this.loudness,
    required this.frequentlyUsed,
    required this.gramErrors,
  });

  final int expression;
  final int geatures;
  final List<String> misspelledWords;
  final int loudness;
  final List<String> frequentlyUsed;
  final int gramErrors;

  factory Results.fromRawJson(String str) => Results.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        expression: json["expression"],
        geatures: json["geatures"],
        misspelledWords:
            List<String>.from(json["misspelled_words"].map((x) => x)),
        loudness: json["loudness"],
        frequentlyUsed:
            List<String>.from(json["frequently_used"].map((x) => x)),
        gramErrors: json["gram_errors"],
      );

  Map<String, dynamic> toJson() => {
        "expression": expression,
        "geatures": geatures,
        "misspelled_words": List<dynamic>.from(misspelledWords.map((x) => x)),
        "loudness": loudness,
        "frequently_used": List<dynamic>.from(frequentlyUsed.map((x) => x)),
        "gram_errors": gramErrors,
      };
}
