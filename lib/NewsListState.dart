import 'dart:convert';

import 'package:flutter/material.dart';

import 'Film.dart';
import 'package:http/http.dart' as http;

class NewsListState extends State<NewsList> {

  List<Film> _newsArticles = List<Film>();

  ListTile _buildItemsForListView(BuildContext context, int index) {
    return ListTile(
      title: Text(_newsArticles[index].title),
      subtitle: Text(_newsArticles[index].title, style: TextStyle(fontSize: 18)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: _newsArticles.length,
          itemBuilder: _buildItemsForListView,
        )
    );
  }

  fetchPost(String query) async {
    final response = await http.get('https://api.themoviedb.org/3/search/movie?api_key=ecb0c9d3850659d960b3e38aa29696a4&query=$query');
    if (response.statusCode == 200) {
      var parsedJson =  json.decode(response.body);

      var list = parsedJson['results'] as List;
      var result = list.map((i) => Film.fromJson(i)).toList();
      print(result);
      setState(() {
        _newsArticles = result;
      });
    } else {
      throw Exception('Failed to load post');
    }
  }

}

class NewsList extends StatefulWidget {
  @override
  createState() => NewsListState();
}