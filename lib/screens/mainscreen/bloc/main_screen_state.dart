class MainScreenState {}

class SearchLoadingState extends MainScreenState {}

class SearchCompleteState extends MainScreenState {
  final List<String> searchResult;

  SearchCompleteState(this.searchResult);
}

class SearchCancelState extends MainScreenState {}

class SearchClearState extends MainScreenState {}
class FileLoadState extends MainScreenState {}
