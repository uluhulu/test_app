class MainScreenEvent {}

class LoadFileEvent extends MainScreenEvent {}

class TypeSearchEvent extends MainScreenEvent {
  final String searchText;

  TypeSearchEvent(this.searchText);
}

class CancelSearchEvent extends MainScreenEvent {}

class ClearSearchEvent extends MainScreenEvent {}
