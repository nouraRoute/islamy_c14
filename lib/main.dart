import 'package:flutter/material.dart';
import 'package:islamy_c14/common/app_theme.dart';
import 'package:islamy_c14/home_screen/home_screen.dart';
import 'package:islamy_c14/home_screen/tabs/home_tab/sura_details_screen.dart';
import 'package:islamy_c14/provider/basic_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => BasicProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: AppTheme.darkTheme,
      themeMode: context.watch<BasicProvider>().curantTheme,
      theme: AppTheme.lightTheme,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SuraDetailsScreen.routname: (_) => const SuraDetailsScreen()
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
