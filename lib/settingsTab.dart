import 'package:flutter/material.dart';
import 'package:islamy/common/themes.dart';
import 'package:islamy/themeSettings.dart';
import 'package:provider/provider.dart';

class SettinsTab extends StatefulWidget {
  const SettinsTab({super.key});

  @override
  State<SettinsTab> createState() => _SettinsTabState();
}

class _SettinsTabState extends State<SettinsTab> {
  bool darkTheme = true;
  //ThemeMode appTheme=Theme.of(context).brightness;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeSettings>(context);
    return Container(
      margin: EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'theme',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Transform.scale(
                  scale: 2,
                  child: Switch(
                      value: Provider.of<ThemeSettings>(context).isDark,
                      activeTrackColor: Color.fromARGB(255, 109, 109, 112),
                      activeColor: Colors.white,
                      inactiveTrackColor: Color.fromARGB(255, 36, 33, 33),
                      inactiveThumbColor: Color.fromARGB(255, 212, 173, 65),
                      onChanged: (value) {
                        provider.changeTheme(
                            value ? ThemeMode.dark : ThemeMode.light);
                      }),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'language',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                DropdownButton(
                  value: 'en',
                  items: [
                    DropdownMenuItem(
                      child: Text('عربي'),
                      value: 'ar',
                    ),
                    DropdownMenuItem(
                      child: Text('English'),
                      value: 'en',
                    ),
                  ],
                  onChanged: (value) {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
