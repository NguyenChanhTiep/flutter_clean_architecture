import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_movie_dp/pages/main/main_page.dart';

import 'app_localizations.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildMaterialApp(context);
  }

  Widget _buildMaterialApp(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Movie App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      supportedLocales: Localize.values.map((localize) => localize.toLocale()),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: MainPage(),
    );
  }
}
