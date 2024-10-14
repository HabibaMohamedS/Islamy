import 'package:flutter/material.dart';
import 'package:islamy/RadioTab.dart';
import 'package:islamy/hadethTab.dart';
import 'dart:async';
import 'package:islamy/common/themes.dart';
import 'package:islamy/quran_tab.dart';
import 'package:islamy/sebhaTab.dart';
import 'package:islamy/settingsTab.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SecondScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Color(0xFF141A2E),
      child: Theme.of(context).brightness == Brightness.light
          ? Image.asset('images/logo2.png')
          : Image.asset('images/logo.png'),
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int index = 0;
  List<Widget> tabs = [
    RadioTab(),
    SebhaTAb(),
    HadethTab(),
    Quran_tab(),
    SettinsTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: Theme.of(context).brightness == Brightness.light
            ? AssetImage("images/default_bg.png")
            : AssetImage('images/dark_bg.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.transparent,
          title: Text(
            'islamy',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: tabs[index],
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomNavigationBar(

            // backgroundColor:
            //     Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            //unselectedItemColor: Colors.white,
            //showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('images/icon_radio.png')),
                  label: 'radio'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('images/icon_sebha.png')),
                  label: 'sebha'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('images/icon_hadeth.png')),
                  label: 'hadith'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('images/icon_quran.png')),
                  label: 'quran'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'settings'),
            ]),
      ),
    );
  }
}
