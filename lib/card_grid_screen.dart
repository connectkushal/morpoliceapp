import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portal_demo/widgets/animated_card.dart';
import 'app_localization.dart';
import 'widgets/drawer_widget.dart';

class CardGridScreen extends StatefulWidget {
  CardGridScreen({Key key}) : super(key: key);

  @override
  _CardGridScreenState createState() => _CardGridScreenState();
}

class _CardGridScreenState extends State<CardGridScreen> {
  @override
  Widget build(BuildContext context) {
    var columnCount = 2;

    return Scaffold(
      drawer: DrawerWidget(),
      //endDrawer: DrawerWidget(),
      appBar: AppBar(
        //leading: Icon(Icons.filter_b_and_w),
        title: Text(AppLocalizations.of(context).translate('appBarTitle')),
      ),
      bottomNavigationBar: bottomBar2(),
      body: SafeArea(
        child: AnimationLimiter(
          child: GridView.count(
            childAspectRatio: 1.0,
            padding: const EdgeInsets.fromLTRB(8.0, 20, 8, 5),
            crossAxisCount: columnCount,
            children: gridCards(columnCount),
          ),
        ),
      ),
    );
  }

  gridCards(int columnCount) {
    return <Widget>[
      AnimatedCard(
        icon: FontAwesomeIcons.edit,
        iconColor: Colors.deepPurpleAccent,
        columnCount: columnCount,
        title: "Complain",
        onPressed: () {},
        position: 0,
      ),
      AnimatedCard(
        icon: FontAwesomeIcons.handsHelping,
        columnCount: columnCount,
        title: "Apna Thana",
        onPressed: () {},
        position: 0,
      ),
      AnimatedCard(
        icon: FontAwesomeIcons.exclamationCircle,
        iconColor: Colors.redAccent,
        columnCount: columnCount,
        title: "SOS",
        onPressed: () {},
        position: 0,
      ),
      AnimatedCard(
        icon: FontAwesomeIcons.phoneSquareAlt,
        columnCount: columnCount,
        iconColor: Colors.teal,
        title: "Phone Milaye",
        onPressed: () {},
        position: 0,
      ),
      AnimatedCard(
        icon: FontAwesomeIcons.servicestack,
        iconColor: Colors.purple,
        columnCount: columnCount,
        title: "Emergency Services",
        onPressed: () {},
        position: 0,
      ),
      AnimatedCard(
        icon: FontAwesomeIcons.link,
        iconColor: Colors.blue[900],
        columnCount: columnCount,
        title: "External Links",
        onPressed: () {},
        position: 0,
      ),
    ];
  }

  bottomBar2() {
    return new BottomAppBar(
      //color: Colors.white,
      //elevation: 20.0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.blue[50],
            ],
          ),
        ),
        height: 80.0,
        child: new Row(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              padding: EdgeInsets.fromLTRB(8.0, 3.0, 8.0, 20.0),
              iconSize: 70.0,
              icon: Icon(
                FontAwesomeIcons.facebookSquare,
                color: Color(0xff3b5998),
              ),
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.fromLTRB(8.0, 3.0, 8.0, 20.0),
              iconSize: 70.0,
              icon: Icon(
                FontAwesomeIcons.twitterSquare,
                color: Color(0xff00acee),
              ),
              onPressed: () {},
            ),
            IconButton(
              padding: EdgeInsets.fromLTRB(8.0, 3.0, 8.0, 20.0),
              iconSize: 70.0,
              icon: Icon(
                FontAwesomeIcons.whatsappSquare,
                color: Color(0xff25D366),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    ); //bottomAppBar
  }
}
