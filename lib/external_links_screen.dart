import 'package:flutter/material.dart';
import 'package:portal_demo/resources/external_link_model.dart';

import 'resources/link_bloc.dart';

class ExternalLinksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("External Links"),
      ),
      body: FutureBuilder<List<ExternalLinkModel>>(
          future: linkBloc.fetchLinks(),
          initialData: [],
          builder: (context, AsyncSnapshot<List<ExternalLinkModel>> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Container(
                padding: EdgeInsets.all(20),
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    ExternalLinkModel l = snapshot.data[index];
                    return ListTile(
                      leading: Icon(Icons.link),
                      trailing: Icon(Icons.arrow_forward_ios),
                      title: Text("${l.name}"),
                      onTap: () {
                        //navigate to webview with url linkBloc.items[index].url
                        Navigator.pushNamed(
                          context,
                          'webview',
                          arguments: ExternalLinkModel.args(l.name, l.url),
                        );
                      },
                    );
                  },
                ),
              );
            }
          }),
    );
  }
}
