import 'package:flutter/material.dart';
import 'package:islamy/hadith_screen.dart';
import 'package:islamy/suraTab.dart';
import 'package:islamy/themeSettings.dart';
import 'package:provider/provider.dart';
import 'splash.dart';
import 'common/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
      ChangeNotifierProvider(child: MyApp(), create: (_) => ThemeSettings()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      //themeMode: ThemeMode.light,
      themeMode: Provider.of<ThemeSettings>(context).appTheme,
      routes: {
        '/': (context) => MyHomePage(),
        'SuraTab': (context) => SuraTab(),
        'hadithScreen': (context) => HadithScreen()
      },
      initialRoute: '/',
    );
  }
}
