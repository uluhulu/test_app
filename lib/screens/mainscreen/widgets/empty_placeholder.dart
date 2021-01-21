import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Не найдено",
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
