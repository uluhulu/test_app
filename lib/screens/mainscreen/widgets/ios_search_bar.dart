import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosSearchBar extends StatelessWidget {
  final Function(String text) onChanged;
  final VoidCallback onSearchClear;
  final VoidCallback onSearchCancel;
  final TextEditingController controller;

  const IosSearchBar({
    Key key,
    this.onChanged,
    this.controller,
    this.onSearchClear,
    this.onSearchCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CupertinoTextField(
            onChanged: onChanged,
            controller: controller,
            prefix: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
            ),
            suffix: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: onSearchClear,
                child: Icon(
                  CupertinoIcons.clear_thick_circled,
                  color: Colors.grey,
                ),
              ),
            ),
            placeholder: "Поиск",
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        CupertinoButton(
          onPressed: onSearchCancel,
          child: Text("Cancel"),
          padding: EdgeInsets.only(left: 8),
        )
      ],
    );
  }
}
