import 'package:flutter/material.dart';
import 'package:portal_demo/widgets/complain_widget.dart';
import 'resources/complain_bloc.dart';

class ComplainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Register your complain"),
      ),
      body: FutureBuilder(
        future: cpBloc.loadComplainScreen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          }

          return Center(
            child: ComplainWidget(),
          );
        },
      ),
    );
  }
}
