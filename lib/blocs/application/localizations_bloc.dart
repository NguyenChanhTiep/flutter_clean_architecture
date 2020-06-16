import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_clean_architecture/blocs/application/localizations_event.dart';
import 'package:flutter_clean_architecture/blocs/application/localizations_state.dart';

export 'package:flutter_clean_architecture/blocs/application/localizations_event.dart';
export 'package:flutter_clean_architecture/blocs/application/localizations_state.dart';

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
