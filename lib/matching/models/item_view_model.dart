import 'package:deck_cards_matching/matching/services/items_service.dart';
import 'package:flutter/material.dart';

enum ItemState {
  FaceDown,
  FaceUp,
  Matched,
}

class ItemViewModel with ChangeNotifier {
  final ItemInfo info;

  bool _isLocked;
  ItemState _state;

  ItemViewModel({this.info}) {
    state = ItemState.FaceDown;
    isLocked = false;
  }

  ItemState get state => _state;
  set state(ItemState newState) {
    _state = newState;

    notifyListeners();
  }

  bool get isLocked => _isLocked;
  set isLocked(bool isLocked) {
    _isLocked = isLocked;

    notifyListeners();
  }
}
