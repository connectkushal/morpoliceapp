import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:path/path.dart';
import 'package:portal_demo/example_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'app_localization.dart';
import 'card_grid_screen.dart';
import 'complain_screen.dart';
import 'external_links_screen.dart';
import 'resources/external_link_model.dart';
import 'widgets/asyncinitwrapper.dart';

// import 'example_app.dart';
//import 'select_language_screen.dart';
SharedPreferences sp;
LocationData myLocation;
Database db;
var dlist;
GoogleMapController gmapController;
void main() {
  runApp(MyApp());
  //runApp(ExampleApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AsyncInitWrapper(
      onInit: () async {
        //await Future.delayed(Duration(seconds: 5));
        sp = await SharedPreferences.getInstance();
        print('$sp');

        Location loc = Location();
        myLocation = await loc.getLocation();

        String databasesPath = await getDatabasesPath();
        print(databasesPath.toString());
        String path = join(databasesPath, 'userdb_mp.db');
        print(path);
        db = await openDatabase(
          path,
          version: 1,
          onCreate: (Database dbs, int version) async {
            // When creating the db, create the table
            await dbs.execute('CREATE TABLE my_table (name TEXT, type TEXT)');
          },
        );
        //dlist = await db.query('my_table', columns: ['name', 'type']);
        print(db.isOpen);
      },
      builder: (context, snapshot) {
        switch (snapshot.data) {
          case (StartupState.Busy):
            //Loading Scaffold, eg spalsh screen
            return WidgetsApp(
              builder: (context, int) {
                return Container(
                  color: Colors.indigo,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Image.asset("assets/images/cg_police_logo.png"),
                      //CircularProgressIndicator(),
                    ],
                  ),
                );
              },
              color: Colors.blue,
            );

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
              routes: {
                "webview": (context) {
                  ExternalLinkModel args =
                      ModalRoute.of(context).settings.arguments;

                  // print('${args.url} , ${args.name}');

                  return WebviewScaffold(
                    hidden: true,
                    url: args.url,
                    appBar: AppBar(title: Text(args.name)),
                  );
                },
                "externalLinks": (context) => ExternalLinksScreen(),
                "complain": (context) => ComplainScreen(),
                "aboutCGPolice": (context) {
                  return WebviewScaffold(
                    url: "http://phpmaya.com/about-cg-police",
                    hidden: true,
                    appBar: AppBar(title: Text("About Chhattisgarh Police")),
                  );
                },
                //"mapscreen": (context) => MapSample(),
              },
            );

          default:
            return Container();
        }
      },
    );
  }
}

// class ExternalLinkModelArgs {
//   String url;
//   String title;

//   ExternalLinkModelArgs(this.url, this.title);
// }
