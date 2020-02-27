import 'dart:ui';

import 'package:meta/meta.dart';

abstract class LocalizationsEvent {}

class ChangeLocalizationEvent extends LocalizationsEvent {
  final Locale locale;

  ChangeLocalizationEvent({@required this.locale});
}
