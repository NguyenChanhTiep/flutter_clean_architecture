import 'dart:ui';

import 'package:meta/meta.dart';

abstract class LocalizationsState {
  final Locale locale;

  LocalizationsState({@required this.locale});
}

class DefaultLocale extends LocalizationsState {
  DefaultLocale({@required Locale locale}) : super(locale: locale);
}

class ChangedLocale extends LocalizationsState {
  ChangedLocale({@required Locale locale}) : super(locale: locale);
}
