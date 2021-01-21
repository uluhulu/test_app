import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/data/searh/search_interactor.dart';
import 'package:test_app/data/searh/search_repository.dart';
import 'package:test_app/screens/mainscreen/bloc/main_screen_event.dart';
import 'package:test_app/screens/mainscreen/bloc/main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final searchController = TextEditingController();
  final searchInteractor = SearchInteractor(SearchRepository());

  MainScreenBloc() : super(MainScreenState()) {
    init();
  }

  @override
  Stream<MainScreenState> mapEventToState(MainScreenEvent event) async* {
    yield* mapSearchEvent(event);
    yield* mapSearchCancelEvent(event);
    yield* mapSearchClearEvent(event);
    yield* mapLoadFileEvent(event);
  }

  void init() {
    searchController.addListener(() {
      if (searchController.text.isNotEmpty) {
        add(TypeSearchEvent(searchController.text));
      }
    });

    add(LoadFileEvent());
  }

  Stream<MainScreenState> mapSearchEvent(MainScreenEvent event) async* {
    if (event is TypeSearchEvent) {
      print("запрос на поиск ${event.searchText}");
      yield SearchLoadingState();
      final searchResult = await searchInteractor.search(event.searchText);
      yield SearchCompleteState(searchResult);
    }
  }

  Stream<SearchCancelState> mapSearchCancelEvent(MainScreenEvent event) async* {
    if (event is CancelSearchEvent) {
      searchController.clear();
      yield SearchCancelState();
    }
  }

  Stream<SearchClearState> mapSearchClearEvent(MainScreenEvent event) async* {
    if (event is ClearSearchEvent) {
      searchController.clear();
      yield SearchClearState();
    }
  }

  Stream<MainScreenState> mapLoadFileEvent(MainScreenEvent event) async* {
    if (event is LoadFileEvent) {
      yield FileLoadState();
      await searchInteractor.loadWords();
      yield MainScreenState();
    }
  }
}
