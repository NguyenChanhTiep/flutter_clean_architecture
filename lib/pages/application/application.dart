import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_movie_dp/pages/application/bloc/localizations_bloc.dart';
import 'package:flutter_movie_dp/pages/main/main_page.dart';

import 'app_localizations.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocalizationsBloc>(
      create: (_) => LocalizationsBloc(defaultLocale: Locale('en')),
      child: BlocBuilder<LocalizationsBloc, LocalizationsState>(
        builder: (context, state) {
          return _buildMaterialApp(context, state.locale);
        },
      ),
    );
  }

  Widget _buildMaterialApp(BuildContext context, Locale locale) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Movie App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      locale: locale,
      supportedLocales: Localize.values.map((localize) => localize.toLocale()),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) {
          return supportedLocales.first;
        }
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
