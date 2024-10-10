import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/hadith_screen.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> hadithModelList = [];
  @override
  Widget build(BuildContext context) {
    if (hadithModelList.isEmpty) {
      loadHadith();
    }
    return Container(
      child: Column(
        children: [
          Image.asset('assets/images/hadeth_logo.png'),
          Divider(
            thickness: 3,
          ),
          Text(
            'الأحاديث',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Divider(
            thickness: 3,
          ),
          Expanded(
            child: SingleChildScrollView(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: hadithModelList.length,
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 2,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    HadithScreen.routName,
                                    arguments: Hadeth(
                                        name: hadithModelList[index].name,
                                        content:
                                            hadithModelList[index].content));
                              },
                              child: Text(
                                hadithModelList[index].name,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              )),
                        ],
                      );
                    })),
          )
        ],
      ),
    );
  }

  loadHadith() async {
    List<Hadeth> _hadithList = [];
    String data = await rootBundle.loadString('assets/hadeth/ahadeth.txt');
    List<String> hadithList = data.trim().split('#');
    hadithList.removeWhere((element) => element.trim().isEmpty);
    for (var i = 0; i < hadithList.length; i++) {
      int index = hadithList[i].trim().indexOf('\n');
      String name = hadithList[i].trim().substring(0, index);
      String content = hadithList[i].trim().substring(index + 1);
      _hadithList.add(Hadeth(name: name, content: content));
    }
    hadithModelList = _hadithList;
    setState(() {});
  }
}

class Hadeth {
  String name;
  String content;
  Hadeth({required this.name, required this.content});
}
