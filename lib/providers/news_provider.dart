
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newapi/models/news_model.dart';
import 'package:http/http.dart' as http;
class Newsprovider extends ChangeNotifier {
  List<News> news = [];
  List<News> get newGetter => news;
  Future<void> newss(String country) async {
    final respons = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=$country&apiKey=4e5a0d8ab73f428882ab2600ff602683"));
    List<dynamic> decodedresponse = jsonDecode(respons.body)["articles"];
    List<News> finalresponse =
        decodedresponse.map((mapdata) => News.from(mapdata)).toList();
    news = finalresponse;
    notifyListeners();
  }
}
