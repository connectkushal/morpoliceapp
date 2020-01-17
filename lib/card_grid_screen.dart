import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widgets/animated_card.dart';
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
        backgroundColor: Colors.indigo[900],
        //leading: Icon(Icons.filter_b_and_w),
        title: Text(
          AppLocalizations.of(context).translate('appBarTitle'),
          style: TextStyle(color: Colors.white),
        ),
      ),
      bottomNavigationBar: bottomBar2(),
      body: SafeArea(
        child: AnimationLimiter(
          child: Builder(builder: (context) {
            return GridView.count(
              childAspectRatio: 1.0,
              padding: const EdgeInsets.fromLTRB(8.0, 20, 8, 5),
              crossAxisCount: columnCount,
              children: gridCards(context, columnCount),
            );
          }),
        ),
      ),
    );
  }

  gridCards(BuildContext cntxt, int columnCount) {
    BuildContext context = cntxt;
    return <Widget>[
      AnimatedCard(
        icon: FontAwesomeIcons.penSquare,
        iconColor: Colors.pink[900],
        columnCount: columnCount,
        title: "Complain",
        // backgroundColor: ,
        // textColor: Colors.white,
        onPressed: () async {
          Scaffold.of(cntxt)
              .showSnackBar(SnackBar(content: Text('Complain Registered')));
          var result = await Navigator.of(context).pushNamed("complain");
          print(result);
          if (result == true && result != null) {
            print(result);
          }
        },
        position: 0,
      ),
      AnimatedCard(
        icon: FontAwesomeIcons.solidHandshake,
        iconColor: Colors.brown[900],
        // iconColor: Colors.white70,
        // backgroundColor: Colors.brown[900],
        // textColor: Colors.white,
        columnCount: columnCount,
        title: "Apna Thana",
        onPressed: () {},
        position: 0,
      ),
      AnimatedCard(
        icon: FontAwesomeIcons.phoneSquareAlt,
        iconColor: Colors.indigo[900],
        columnCount: columnCount,
        title: "Phone Milaye",
        onPressed: () {},
        position: 0,
      ),
      AnimatedCard(
        icon: FontAwesomeIcons.exclamationCircle,
        iconColor: Colors.red,
        // iconColor: Colors.white,
        // backgroundColor: Colors.red,
        textColor: Colors.red[900],
        columnCount: columnCount,
        title: "SOS",
        onPressed: () {},
        position: 0,
      ),
      AnimatedCard(
        icon: FontAwesomeIcons.externalLinkSquareAlt,
        iconColor: Colors.grey[700],
        // iconColor: Colors.white,
        // backgroundColor: Colors.grey[600],
        // textColor: Colors.white,
        columnCount: columnCount,
        title: "External Links",
        onPressed: () {
          Navigator.pushNamed(context, "externalLinks");
        },
        position: 0,
      ),
      AnimatedCard(
        icon: FontAwesomeIcons.servicestack,
        iconColor: Colors.purple,
        // iconColor: Colors.white70,
        // backgroundColor: Colors.purple,
        // textColor: Colors.white,
        columnCount: columnCount,
        title: "Emergency Services",
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
