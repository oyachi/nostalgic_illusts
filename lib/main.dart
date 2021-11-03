import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'screens/template.dart';
/* configs */
import './configs/contains.dart';

void main() {
  runApp(
      ProviderScope(
        child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nostalgic Illusts',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
      ),
      debugShowCheckedModeBanner: false,
      home: Template(),
    );
  }
}