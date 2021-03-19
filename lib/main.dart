import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'common/models/settings_view_model.dart';
import 'common/services/settings_service.dart';
import 'matching/models/difficulty_view_model.dart';
import 'matching/models/game_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SettingsViewModel(
            settingsService: SettingsService(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => DifficultyViewModel(
            difficulty: Difficulty.Easy,
          ),
        ),
      ],
      builder: (context, widget) => widget,
      child: MyApp(),
    ),
  );
}
