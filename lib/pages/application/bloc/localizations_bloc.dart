import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'localizations_event.dart';
import 'localizations_state.dart';

export 'localizations_event.dart';
export 'localizations_state.dart';

class LocalizationsBloc extends Bloc<LocalizationsEvent, LocalizationsState> {
  final Locale defaultLocale;

  LocalizationsBloc({
    @required this.defaultLocale,
  });

  @override
  LocalizationsState get initialState => DefaultLocale(locale: defaultLocale);

  @override
  Stream<LocalizationsState> mapEventToState(event) async* {
    if (event is ChangeLocalizationEvent) {
      yield ChangedLocale(locale: event.locale);
    }
  }
}
