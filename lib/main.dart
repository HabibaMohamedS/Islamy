import 'package:flutter/material.dart';
import 'package:islamy/hadith_screen.dart';
import 'package:islamy/suraTab.dart';
import 'package:islamy/themeSettings.dart';
import 'package:provider/provider.dart';
import 'splash.dart';
import 'common/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String savedLanguage = prefs.getString('language') ?? 'en';
  String theme = prefs.getString('theme') ?? 'light';
  runApp(ChangeNotifierProvider(
      child: MyApp(), create: (_) => ThemeSettings(savedLanguage, theme)));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      locale: Locale(Provider.of<ThemeSettings>(context).localCode),
      darkTheme: Themes.dark,
      //themeMode: ThemeMode.light,
      themeMode: (Provider.of<ThemeSettings>(context).theme == 'light')
          ? ThemeMode.light
          : ThemeMode.dark,
      routes: {
        '/homePage': (context) => MyHomePage(),
        'SuraTab': (context) => SuraTab(),
        'hadithScreen': (context) => HadithScreen()
      },
      initialRoute: '/homePage',
    );
  }
}
