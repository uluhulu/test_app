import 'package:flutter/material.dart';

class WordsList extends StatelessWidget {
  final List<String> words;


  const WordsList({Key key, this.words}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: words.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("${words[index]}"),
        );
      },
    );
  }
}
