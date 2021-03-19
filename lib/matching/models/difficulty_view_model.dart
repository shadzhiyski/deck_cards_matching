import 'package:flutter/material.dart';

import 'game_view_model.dart';

class DifficultyViewModel extends ChangeNotifier {
  Difficulty _difficulty;

  DifficultyViewModel({Difficulty difficulty}) {
    this.difficulty = difficulty;
  }

  Difficulty get difficulty => _difficulty;
  set difficulty(Difficulty value) {
    _difficulty = value;

    notifyListeners();
  }
}
