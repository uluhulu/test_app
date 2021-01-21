import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/screens/mainscreen/bloc/main_screen_bloc.dart';
import 'package:test_app/screens/mainscreen/bloc/main_screen_event.dart';
import 'package:test_app/screens/mainscreen/bloc/main_screen_state.dart';
import 'package:test_app/screens/mainscreen/widgets/android_search_bar.dart';
import 'package:test_app/screens/mainscreen/widgets/empty_placeholder.dart';
import 'package:test_app/screens/mainscreen/widgets/file_loader_placeholder.dart';
import 'package:test_app/screens/mainscreen/widgets/ios_search_bar.dart';
import 'package:test_app/screens/mainscreen/widgets/loader.dart';
import 'package:test_app/screens/mainscreen/widgets/words_list.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenBloc(),
      child: BlocConsumer<MainScreenBloc, MainScreenState>(
        listener: (context, state) {
          if (state is SearchCancelState) {
            _closeKeyboard(context);
          }
        },
        builder: (context, state) {
          return Stack(children: [
            Scaffold(
              appBar: AppBar(
                backgroundColor:
                    Platform.isAndroid ? Colors.blueAccent : Colors.white,
                title: _buildAppbar(
                  (text) {},
                  context,
                ),
              ),
              body: _buildBody(state),
            ),
            _buildLoadingPlaceholder(state),
          ]);
        },
      ),
    );
  }

  Widget _buildLoadingPlaceholder(MainScreenState state) {
    if (state is FileLoadState) {
      return FileLoaderPlaceholder();
    }
    return SizedBox();
  }

  Widget _buildBody(MainScreenState state) {
    if (state is SearchLoadingState) {
      return Center(child: Loader());
    }

    if (state is SearchCompleteState) {
      final searchResult = state.searchResult;
      if (searchResult.isEmpty) {
        return EmptyPlaceholder();
      }
      return WordsList(
        words: searchResult,
      );
    }

    return SizedBox();
  }

  Widget _buildAppbar(
    Function(String text) onChanged,
    BuildContext context,
  ) {
    final bloc = BlocProvider.of<MainScreenBloc>(context);
    if (Platform.isAndroid) {
      return AndroidSearchBar(
        onChanged: onChanged,
        controller: bloc.searchController,
        onSearchCancel: () {
          bloc.add(CancelSearchEvent());
        },
        onSearchClear: () {
          bloc.add(ClearSearchEvent());
        },
      );
    }

    return IosSearchBar(
      onChanged: onChanged,
      controller: bloc.searchController,
      onSearchCancel: () {
        bloc.add(CancelSearchEvent());
      },
      onSearchClear: () {
        bloc.add(ClearSearchEvent());
      },
    );
  }

  void _closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }
}
