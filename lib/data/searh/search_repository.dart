import 'dart:convert';

import 'package:flutter/services.dart';

class SearchRepository {

  Future<List<String>> loadWords() async {
    final lineSplitter = LineSplitter();

    final wordsText = await rootBundle.loadString('assets/words/words.txt');

    return lineSplitter.convert(wordsText);
  }
}
