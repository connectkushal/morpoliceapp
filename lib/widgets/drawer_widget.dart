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
            //initiallyExpanded: true,

            title: Text("Your Profile"),
            backgroundColor: Colors.blueGrey[50],
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text("Name: Xyz Abc"),
                    Text("Gender: Male"),
                    Text("Address: asdf asdf asdf"),
                    Text("Ph No: 8000399923"),
                    Text("_______________________")
                  ],
                ),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.edit),
                title: Text("Edit Profile"),
              ),
            ],
          ),
          ExpansionTile(
            title: Text("About CG Police"),
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
            title: Text("FAQs"),
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
            title: Text("Feedback"),
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
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(100),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Colors.blue[100],
          ],
        ),
      ),
      //
      //color: Colors.blue[100],
      padding: EdgeInsets.all(1.0),
      height: 150.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10.0),
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
