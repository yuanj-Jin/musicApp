import 'package:flutter/material.dart';
import 'package:musicapp/components/mine.dart';
import 'package:musicapp/router/router.dart';
void main() {
  runApp(MyApp());
}

 class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      // home: Mine(),
      onGenerateRoute: onGenerateRoute,
      initialRoute: '/',
    );
  }
}
