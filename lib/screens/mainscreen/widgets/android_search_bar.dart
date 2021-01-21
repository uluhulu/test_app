import 'package:flutter/material.dart';

class AndroidSearchBar extends StatelessWidget {
  final Function(String text) onChanged;
  final VoidCallback onSearchClear;
  final VoidCallback onSearchCancel;
  final TextEditingController controller;

  const AndroidSearchBar({
    Key key,
    this.onChanged,
    this.controller,
    this.onSearchClear,
    this.onSearchCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          decoration: new InputDecoration(
            // hoverColor: Colors.white,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            suffixIcon: GestureDetector(
              onTap: onSearchClear,
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
            border: InputBorder.none,
            hintText: "Поиск",
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
      TextButton(
        onPressed: onSearchCancel,
        child: Text(
          "Cancel",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ]);
  }
}
