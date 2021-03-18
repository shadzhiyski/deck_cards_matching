import 'package:deck_cards_matching/matching/services/items_service.dart';
import 'package:flutter/material.dart';

import 'item_view_model.dart';

enum GameState {
  Started,
  Finished,
}

class GameViewModel with ChangeNotifier {
  final ItemsService imageService;
  List<ItemViewModel> _items;

  GameState _state;

  GameViewModel({this.imageService}) {
    _initModel();
  }

  void _initModel() {
    state = GameState.Started;
    _fillItems();
  }

  void _fillItems() {
    _items = imageService
        .getRandomItems(20)
        .map((info) => ItemViewModel(info: info))
        .toList();
  }

  List<ItemViewModel> get items => _items;

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

  refresh() {
    _fillItems();
    setActiveItemsLocking(false);
    state = GameState.Started;
  }
}
