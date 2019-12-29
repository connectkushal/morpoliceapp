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
    return Container(
      color: Colors.brown[100],
      padding: EdgeInsets.all(1.0),
      height: 150.0,

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 5.0, left: 5.0),
            height: 125.0,
            child: Image.asset("assets/images/cg_police_logo.png"),
          ),
          Flexible(
            child: Text(
              'Welcome to Mor Police',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
