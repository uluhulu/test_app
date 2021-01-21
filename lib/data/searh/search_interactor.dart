import 'package:aho_corasick/aho_corasick.dart';
import 'package:test_app/data/searh/search_repository.dart';

class SearchInteractor {
  final SearchRepository searchRepository;

  List<String> wordsList = [];
  AhoCorasick ahoCorasick;

  SearchInteractor(this.searchRepository);

  Future loadWords() async {
    final wordsList = await searchRepository.loadWords();
    this.wordsList = wordsList;
  }

  Future<List<String>> search(String searchPhrase) {
    final results = <String>[];
    wordsList.forEach((e) {
      if (e.startsWith(searchPhrase)) {
        results.add(e);
      }
    });
    return Future.value(results);
  }
}
