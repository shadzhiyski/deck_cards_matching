import 'package:flutter/material.dart';

class ItemFaceDown extends StatelessWidget {
  final Function onItemPressed;

  const ItemFaceDown({Key key, this.onItemPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onItemPressed,
        child: Text(
          '',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      );
}
