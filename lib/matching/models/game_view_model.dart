import 'package:deck_cards_matching/matching/services/items_service.dart';
import 'package:flutter/material.dart';

import 'item_view_model.dart';

enum GameState {
  Created,
  Started,
  Finished,
}

enum Difficulty {
  Easy,
  Hard,
}

class GameViewModel with ChangeNotifier {
  final ItemsService itemsService;
  List<ItemViewModel> _items;

  GameState _state;
  Difficulty _difficulty;

  GameViewModel({this.itemsService, Difficulty difficulty}) {
    _initModel(difficulty);
  }

  void _initModel(Difficulty difficulty) {
    this.difficulty = difficulty;
    this.state = GameState.Created;
    _fillItems();
  }

  void _fillItems() {
    var uniqueItemsCount = _difficulty == Difficulty.Easy ? 10 : 20;
    _items = itemsService
        .getRandomItems(uniqueItemsCount)
        .map((info) => ItemViewModel(info: info))
        .toList();
  }

  List<ItemViewModel> get items => _items;

  Difficulty get difficulty => _difficulty;
  set difficulty(Difficulty value) {
    _difficulty = value;

    notifyListeners();
  }

  List<ItemViewModel> get selectedItems =>
      items.where((item) => item.state == ItemState.FaceUp).toList();

  GameState get state => _state;
  set state(GameState newState) {
    _state = newState;

    notifyListeners();
  }

  bool tryMatchSelectedItems() {
    var selectedItems = this.selectedItems;
    var doMatch = selectedItems[0].info == selectedItems[1].info;

    var newItemState = ItemState.FaceDown;
    if (doMatch) {
      newItemState = ItemState.Matched;
    }

    selectedItems.forEach((item) => item.state = newItemState);
    selectedItems.clear();

    if (!items.any((item) => item.state != ItemState.Matched)) {
      state = GameState.Finished;
    }

    return doMatch;
  }

  void setActiveItemsLocking(bool areLocked) => items
      .where((item) => item.state != ItemState.Matched)
      .forEach((item) => item.isLocked = areLocked);

  void refresh() {
    _fillItems();
    setActiveItemsLocking(false);
    state = GameState.Started;
  }

  void startGame() {
    this.state = GameState.Started;
    _fillItems();
  }
}
