import 'package:flutter/material.dart';
import 'package:radio_app/src/player/player.dart';

import 'settings/settings_controller.dart';
// import 'settings/settings_view.dart';

import 'package:radio_app/src/home/home.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Predefined variables. Check documentation for these.
          restorationScopeId: 'app',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),
            scaffoldBackgroundColor: Colors.grey[800],
            textTheme: const TextTheme(
              bodySmall: TextStyle(),
              bodyMedium: TextStyle(),
              bodyLarge: TextStyle(),
            ).apply(
              bodyColor: Colors.orange,
              displayColor: Colors.orange,
            ),
          ),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          initialRoute: 'home',
          routes: {
            'home': (context) => const Home(),
            'player': (context) => Player(),
          },
        );
      },
    );
  }
}
