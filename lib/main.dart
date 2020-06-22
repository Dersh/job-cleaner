import 'package:flutter/material.dart';
import './screens/search_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(             
        primarySwatch: Colors.green,        
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SearchPage(title: 'Поиск вакансии'),
    );
  }
}