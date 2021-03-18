import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'common/models/settings_view_model.dart';
import 'common/services/settings_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SettingsViewModel(
            isFullScreen: false,
            cardShowFaceUpDurationInMilliseconds: 1000,
            settingsService: SettingsService(),
          ),
        ),
      ],
      builder: (context, widget) => widget,
      child: MyApp(),
    ),
  );
}
