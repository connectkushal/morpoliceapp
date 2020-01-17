import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:portal_demo/resources/external_link_model.dart';

class LinkBloc {
  Future<List<ExternalLinkModel>> fetchLinks() async {
    var response = await http.get('http://phpmaya.com/api/external-links',
        headers: {"Content-Type": "application/json"});
    // print("fetching: ${response.body}");

    List parsedJson = json.decode(response.body);

    List<ExternalLinkModel> linksList = parsedJson
        .map((i) => ExternalLinkModel.fromJson(i))
        .toList()
        .cast<ExternalLinkModel>();

    return linksList;
  }
}

final linkBloc = LinkBloc();
