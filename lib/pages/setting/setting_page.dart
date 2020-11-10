import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/pages/application/app_localizations.dart';
import 'package:flutter_clean_architecture/blocs/application/localizations_bloc.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Text(
            AppLocalizations.of(context).translate('Language:'),
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          new DropdownButton<Localize>(
            value:
                ConvertLocalize.localize(AppLocalizations.of(context).locale),
            items: Localize.values.map((Localize localize) {
              return new DropdownMenuItem<Localize>(
                value: localize,
                child: new Text(localize.title()),
              );
            }).toList(),
            onChanged: (localize) {
              Future.delayed(Duration(milliseconds: 500), () {
                BlocProvider.of<LocalizationsBloc>(context)
                    .add(ChangeLocalizationEvent(locale: localize.toLocale()));
              });
            },
          )
        ],
      ),
    );
  }
}
