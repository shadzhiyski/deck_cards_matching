import 'package:deck_cards_matching/matching/models/item_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'item_face_down.dart';
import 'item_face_up.dart';

class Item extends StatelessWidget {
  final ItemViewModel model;
  final Function onItemPressed;

  const Item({Key key, this.model, this.onItemPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        value: model,
        builder: (context, widget) => widget,
        child: Consumer<ItemViewModel>(
          builder: (context, model, _) => model.state != ItemState.FaceDown
              ? ItemFaceUp(model: model, onItemPressed: onItemPressed)
              : ItemFaceDown(onItemPressed: onItemPressed),
        ),
      );
}
