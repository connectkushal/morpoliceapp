import 'package:flutter/material.dart';

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
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  height: 125.0,
                  //width: 50.0,
                  child: Image.asset("assets/images/cg_police_logo.png"),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    'Welcome to Mor Police',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),

          // CircleAvatar(
          //   backgroundImage: AssetImage("assets/images/cg_police_logo.png"),
          //   minRadius: 20.0,
          //   maxRadius: 53.0,
          // ),
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
