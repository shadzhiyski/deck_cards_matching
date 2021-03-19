import 'package:deck_cards_matching/matching/models/difficulty_view_model.dart';
import 'package:deck_cards_matching/matching/models/game_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DifficultySelector extends StatefulWidget {
  @override
  _DifficultySelectorState createState() => _DifficultySelectorState();
}

class _DifficultySelectorState extends State<DifficultySelector> {
  List<DifficultySelectViewModel> items;

  @override
  void initState() {
    super.initState();
    items = [
      DifficultySelectViewModel(
        isSelected: true,
        difficulty: Difficulty.Easy,
      ),
      DifficultySelectViewModel(
        isSelected: false,
        difficulty: Difficulty.Hard,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DifficultyViewModel>(
      builder: (context, model, _) => ToggleButtons(
        children: items
            .map<Widget>(
              (item) => Text(
                item.difficulty.toString(),
              ),
            )
            .toList(),
        onPressed: (int index) {
          setState(() {
            items.asMap().forEach((idx, item) {
              item.isSelected = idx == index;
              if (item.isSelected) {
                model.difficulty = item.difficulty;
              }
            });
          });
        },
        isSelected: items.map((item) => item.isSelected).toList(),
      ),
    );
  }
}

class DifficultySelectViewModel {
  bool isSelected;
  Difficulty difficulty;

  DifficultySelectViewModel({this.isSelected, this.difficulty});
}
