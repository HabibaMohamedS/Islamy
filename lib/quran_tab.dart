import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/suraTab.dart';

class Quran_tab extends StatefulWidget {
  const Quran_tab({super.key});

  @override
  State<Quran_tab> createState() => _Quran_tabState();
}

class _Quran_tabState extends State<Quran_tab> {
  List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];
  List<String> virses = [];
  List<int> virsesCount = [];
  @override
  Widget build(BuildContext context) {
    if (virsesCount.isEmpty) {
      return FutureBuilder(
        future: loadSuras(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return buildUI();
          }
        },
      );
    } else {
      return buildUI();
    }
  }

  Widget buildUI() {
    return Container(
      child: Column(
        children: [
          Image.asset('assets/images/qur2an_screen_logo.png'),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: suraNames.length,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(SuraTab.routName,
                          arguments:
                              QuranModel(name: suraNames[index], index: index));
                    },
                    child: Card(
                      elevation: 50,
                      shadowColor: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            suraNames[index],
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(virsesCount[index].toString(),
                              style: Theme.of(context).textTheme.displayMedium)
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> loadSuras() async {
    List<int> _virsesCount = [];

    for (var i = 0; i < suraNames.length; i++) {
      String data = await rootBundle.loadString('assets/quran/${i + 1}.txt');
      List<String> content = data.trim().split('\n');
      content.removeWhere(
        (element) => element.trim().isEmpty,
      );
      _virsesCount.add(content.length);
    }
    virsesCount = _virsesCount;
    setState(() {});
  }
}

class QuranModel {
  String name;
  int index;
  QuranModel({
    required this.name,
    required this.index,
  });
}
