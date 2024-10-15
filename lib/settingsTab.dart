import 'package:flutter/material.dart';
import 'package:islamy/themeSettings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettinsTab extends StatefulWidget {
  const SettinsTab({super.key});

  @override
  State<SettinsTab> createState() => _SettinsTabState();
}

class _SettinsTabState extends State<SettinsTab> {
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
                  AppLocalizations.of(context)!.darkTheme,
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
                        provider.saveChangedTheme(value ? 'dark' : 'light');
                      }),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.language,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                DropdownButton(
                  value: provider.localCode,
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
                  onChanged: (value) {
                    if (value != null) {
                      provider.changeLanguage(value);
                    }
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
