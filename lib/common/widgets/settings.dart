import 'package:deck_cards_matching/common/models/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  SettingsViewModel model;

  @override
  Widget build(BuildContext context) {
    model = Provider.of<SettingsViewModel>(context, listen: false);

    return Column(
      children: [
        SwitchListTile(
          title: const Text('Full Screen'),
          value: model.isFullScreen,
          onChanged: (bool value) {
            setState(() {
              model.isFullScreen = value;
            });
          },
          secondary: Icon(
            !model.isFullScreen ? Icons.fullscreen : Icons.fullscreen_exit,
          ),
        ),
        const Text('Picked pair cards face up duration'),
        Slider(
          value: model.cardShowFaceUpDurationInMilliseconds,
          min: 200,
          max: 3000,
          divisions: 14,
          label: model.cardShowFaceUpDurationInMilliseconds.round().toString(),
          onChanged: (double value) {
            setState(() {
              model.cardShowFaceUpDurationInMilliseconds = value;
            });
          },
        ),
      ],
    );
  }
}
