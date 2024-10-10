import 'package:flutter/material.dart';
import 'package:islamy/hadith_screen.dart';
import 'package:islamy/suraTab.dart';
import 'splash.dart';
import 'common/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.light,
      routes: {
        '/': (context) => MyHomePage(),
        'SuraTab': (context) => SuraTab(),
        'hadithScreen': (context) => HadithScreen()
      },
      initialRoute: '/',
    );
  }
}
