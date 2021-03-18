import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GamePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pushNamed('/game'),
          clipBehavior: Clip.none,
          autofocus: true,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Text(
              'Play',
              style: Theme.of(context).textTheme.headline3.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
