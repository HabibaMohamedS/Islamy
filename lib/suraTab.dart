import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/quran_tab.dart';

class SuraTab extends StatefulWidget {
  const SuraTab({super.key});
  static const routName = 'SuraTab';
  @override
  State<SuraTab> createState() => _SuraTabState();
}

class _SuraTabState extends State<SuraTab> {
  List<String> virses = [];
  @override
  Widget build(BuildContext context) {
    QuranModel quranModel =
        ModalRoute.of(context)!.settings.arguments as QuranModel;
    if (virses.isEmpty) loadSuraContent(quranModel.index);
    return Container(
      color: Theme.of(context).brightness == Brightness.light
          ? Theme.of(context).colorScheme.surface
          : Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          Text(
            quranModel.name,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const Divider(),
          virses.isEmpty
              ? Expanded(
                  child: Center(
                      child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.onSecondary,
                )))
              : Expanded(
                  child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                    virses[index],
                    style: Theme.of(context).textTheme.titleSmall,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                  itemCount: virses.length,
                ))
        ],
      ),
    );
  }

  Future<void> loadSuraContent(int index) async {
    rootBundle.loadString('assets/quran/${index + 1}.txt').then(
      (value) {
        virses = value.split('\n');
        setState(() {});
      },
    );
  }
}
