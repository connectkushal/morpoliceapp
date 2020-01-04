import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localization.dart';
import 'card_grid_screen.dart';
import 'widgets/asyncinitwrapper.dart';
import 'example_app.dart';
//import 'select_language_screen.dart';

void main() {
  runApp(MyApp());
  //runApp(ExampleApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AsyncInitWrapper(
      onInit: () async {
        await Future.delayed(Duration(seconds: 5));
      },
      builder: (context, snapshot) {
        switch (snapshot.data) {
          case (StartupState.Busy):
            //Loading Scaffold, eg spalsh screen
            return CircularProgressIndicator();

          case (StartupState.Error):
            //Error scaffold screen
            return Scaffold();

          case (StartupState.Success):
            //On finished loading scaffold
            return MaterialApp(
              locale: Locale('hi'),
              supportedLocales: [
                Locale('hi'),
                Locale('en'),
              ],
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              home: CardGridScreen(),
              //home: SelectLanguageScreen(),
            );

          default:
            return Container();
        }
      },
    );
  }
}
