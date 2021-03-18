import 'package:deck_cards_matching/matching/models/item_view_model.dart';
import 'package:flutter/material.dart';

class ItemFaceUp extends StatelessWidget {
  final ItemViewModel model;
  final Function onItemPressed;

  const ItemFaceUp({Key key, this.model, this.onItemPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) => OrientationBuilder(
        builder: (context, orientation) => ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: onItemPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  '${model.info.name}',
                  style: (MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? Theme.of(context).textTheme.headline3
                          : Theme.of(context).textTheme.headline4)
                      .copyWith(
                    color: model.state == ItemState.Matched
                        ? Colors.green
                        : Colors.black,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Image(
                  image: AssetImage(
                    'assets/${model.info.type}.png',
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
