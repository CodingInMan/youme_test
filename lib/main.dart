import 'package:flutter/material.dart';
import './list_page.dart';

void main() => runApp(youmeApp());

class youmeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title:'YoumeTest',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue
        ),
        home: ListPage(),
      ),
    );
  }
}