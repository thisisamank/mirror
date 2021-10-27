import 'package:flutter/cupertino.dart';

class User {
  Gender gender;
  int age;
  User(this.gender, this.age);
}

class Gender {
  final GenderClassification gender;
  bool isSelected = false;

  Gender({
    required this.gender,
  });

  void changeSelection() {
    isSelected = !isSelected;
  }
}

enum GenderClassification { male, female }

class GenderProvider extends ChangeNotifier {
  List<Gender> _genders = [
    Gender(gender: GenderClassification.male),
    Gender(gender: GenderClassification.female),
  ];

  List<Gender> get genders => _genders;

  Gender get selected => _genders.firstWhere((element) => element.isSelected);
  void changeGender(Gender gender) {
    _genders = _genders.map((e) {
      e.isSelected = false;
      return e;
    }).toList();
    _genders
        .firstWhere(
          (g) => g == gender,
        )
        .changeSelection();
    notifyListeners();
  }
}
