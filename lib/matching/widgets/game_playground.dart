import 'package:deck_cards_matching/common/models/settings_view_model.dart';
import 'package:deck_cards_matching/matching/models/game_view_model.dart';
import 'package:deck_cards_matching/matching/models/item_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'item.dart';

class GamePlayground extends StatelessWidget {
  final GameViewModel gameModel;

  const GamePlayground({this.gameModel});

  @override
  Widget build(BuildContext context) {
    var settingsModel = Provider.of<SettingsViewModel>(context, listen: false);

    return Expanded(
      child: OrientationBuilder(
        builder: (context, orientation) => GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.landscape
                  ? 8
                  : 5,
          children: gameModel.items
              .map<Widget>(
                (itemModel) => Item(
                  model: itemModel,
                  onItemPressed: () =>
                      _onItemPressed(gameModel, itemModel, settingsModel),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  void _onItemPressed(GameViewModel model, ItemViewModel itemModel,
      SettingsViewModel settingsModel) {
    var selectedItemsLength = model.selectedItems.length;
    if (selectedItemsLength < 2 && !itemModel.isLocked) {
      itemModel.state = itemModel.state == ItemState.FaceDown
          ? ItemState.FaceUp
          : ItemState.FaceDown;
    }

    if (model.selectedItems.length == 2) {
      model.setActiveItemsLocking(true);
      Future.delayed(
          Duration(
            milliseconds:
                settingsModel.cardShowFaceUpDurationInMilliseconds.toInt(),
          ), () {
        model.tryMatchSelectedItems();
        model.setActiveItemsLocking(false);
      });
    }
  }
}
