import 'package:flutter/material.dart';
import 'package:islamy_c14/common/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      theme: AppTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('xxxxx'),
          leading: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
