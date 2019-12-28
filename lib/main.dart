import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

void main() => runApp(
      MaterialApp(
        home: CardGridScreen(),
      ),
    );

class EmptyCard extends StatelessWidget {
  final double width;
  final double height;

  const EmptyCard({
    Key key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: const Offset(0.0, 4.0),
          ),
        ],
      ),
    );
  }
}

class CardGridScreen extends StatefulWidget {
  CardGridScreen({Key key}) : super(key: key);

  @override
  _CardGridScreenState createState() => _CardGridScreenState();
}

class _CardGridScreenState extends State<CardGridScreen> {
  @override
  Widget build(BuildContext context) {
    var columnCount = 3;

    return AutoRefresh(
      duration: const Duration(seconds: 10),
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          title: Text("Mor Portal"),
        ),
        body: SafeArea(
          child: AnimationLimiter(
            child: GridView.count(
              childAspectRatio: 1.0,
              padding: const EdgeInsets.all(8.0),
              crossAxisCount: columnCount,
              children: List.generate(
                30,
                (int index) {
                  return AnimationConfiguration.staggeredGrid(
                    columnCount: columnCount,
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: const ScaleAnimation(
                      scale: 0.5,
                      child: FadeInAnimation(
                        child: EmptyCard(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AutoRefresh extends StatefulWidget {
  final Duration duration;
  final Widget child;

  AutoRefresh({
    Key key,
    @required this.duration,
    @required this.child,
  })  : assert(duration != null),
        super(key: key);

  @override
  _AutoRefreshState createState() => _AutoRefreshState();
}

class _AutoRefreshState extends State<AutoRefresh> {
  int keyValue;
  ValueKey key;

  Timer _timer;

  @override
  void initState() {
    super.initState();

    keyValue = 0;
    key = ValueKey(keyValue);

    _recursiveBuild();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: widget.child,
    );
  }

  void _recursiveBuild() {
    _timer = Timer(
      widget.duration,
      () {
        setState(() {
          keyValue = keyValue + 1;
          key = ValueKey(keyValue);
          _recursiveBuild();
        });
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

class DrawerWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
      //profile, duty poiuts, driver, profile, officer name ontop of drawer
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          drawerHeader(),
          ExpansionTile(
            backgroundColor: Colors.blue[50],
            initiallyExpanded: true,
            title: Text("Overview"),
            children: <Widget>[
              ListTile(
                title: Text("Police Station of your juristiction : Xyz "),
                subtitle: Text(
                    "the accuracy of your jurisdiction is based on your mobile gps location and "),
              ),
              ListTile(
                title: Text("TI name: Abcd"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Ph No: 8000399923"),
              ),
            ],
          ),
          ExpansionTile(
            title: Text("Your Complaints/Reports"),
            children: <Widget>[
              ListTile(
                title: Text("View All"),
                onTap: () {},
              ),
              ListTile(
                title: Text("Modify/Delete"),
                onTap: () {},
              ),
            ],
          ),
          ExpansionTile(
            title: Text("Complaint against Police"),
            children: <Widget>[
              ListTile(
                title: Text("Categories"),
                onTap: () {},
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Enter Complain",
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text("Report Incident"),
            children: <Widget>[
              ListTile(
                title: Text("..."),
                onTap: () {},
              ),
              ListTile(
                title: Text("----"),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget drawerHeader() {
    return DrawerHeader(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Welcome to Mor Portal',
            ),
          ),
          CircleAvatar(
            backgroundImage: AssetImage("assets/cg_police_logo.png"),
            minRadius: 20.0,
            maxRadius: 50.0,
          ),
          // Image(
          //   height: 100.0,
          //   width: 100.0,
          //   fit: BoxFit.fitWidth,
          //   image: AssetImage(
          //     'assets/profile_image.jpeg',
          //   ),
          // ),
        ],
      ),
    );
  }
}
