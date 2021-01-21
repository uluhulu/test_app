import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/screens/mainscreen/widgets/loader.dart';

class FileLoaderPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey.withOpacity(0.4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Загрузка текста, подождите",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Loader(),
          ],
        ),
      ),
    );
  }
}
