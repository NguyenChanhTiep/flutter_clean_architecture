import 'package:flutter/material.dart';
import 'package:flutter_movie_dp/pages/application/app_localizations.dart';

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
            value: ConvertLocalize.localize(AppLocalizations.of(context).locale),
            items: Localize.values.map((Localize localize) {
              return new DropdownMenuItem<Localize>(
                value: localize,
                child: new Text(localize.title()),
              );
            }).toList(),
            onChanged: (localize) {
              // TODO: Edit later
              AppLocalizations.of(context).load(localize.toLocale());
            },
          )
        ],
      ),
    );
  }
}
