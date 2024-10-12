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
        decoration: BoxDecoration(
            image: DecorationImage(
          image: Theme.of(context).brightness == Brightness.light
              ? AssetImage("images/default_bg.png")
              : AssetImage('images/dark_bg.png'),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            foregroundColor: Colors.transparent,
            leading: IconButton(
                icon: Icon(Icons.arrow_back,
                    color: Theme.of(context).colorScheme.onSecondary),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            title: const Text('islamy'),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * .02,
                horizontal: MediaQuery.of(context).size.width * .09),
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .06,
              vertical: MediaQuery.of(context).size.height * .05,
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface.withOpacity(.85),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  quranModel.name,
                  style: Theme.of(context).textTheme.titleLarge,
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
          ),
        ));
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
