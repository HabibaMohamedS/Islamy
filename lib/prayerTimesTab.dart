import 'package:flutter/material.dart';
import 'package:pray_times/pray_times.dart';

class PrayerTab extends StatelessWidget {
  const PrayerTab({super.key});

  @override
  Widget build(BuildContext context) {
    double latitude = 26.8206;
    double longitude = 30.8025;
    double timezone = 2;

    PrayerTimes prayers = new PrayerTimes();
    prayers.setTimeFormat(prayers.Time12);
    prayers.setCalcMethod(prayers.Egypt);
    prayers.setAsrJuristic(prayers.Shafii);
    prayers.setAdjustHighLats(prayers.AngleBased);
    var offsets = [0, 0, 0, 0, 0, 0, 0];
    prayers.tune(offsets);
    final date = DateTime.now();
    List<String> prayerTimes =
        prayers.getPrayerTimes(date, latitude, longitude, timezone);
    List<String> prayerNames = prayers.getTimeNames();

    for (int i = 0; i < prayerTimes.length; i++) {
      print("${prayerNames[i]} - ${prayerTimes[i]}");
    }

    return Container(
      margin: EdgeInsets.all(20),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Egypt Prayer Times",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text("GMT+2"),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: prayerTimes.length,
                      itemBuilder: (context, index) =>
                          //Text("${prayerNames[index]} - ${prayerTimes[index]}"),
                          prayerCard(
                            prayerName: prayerNames[index],
                            prayerTime: prayerTimes[index],
                          )))
            ]),
      ),
    );
  }
}

class prayerCard extends StatelessWidget {
  String prayerName = '';
  String prayerTime = '';
  prayerCard({super.key, required this.prayerName, required this.prayerTime});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black,
      color: Theme.of(context).colorScheme.primary.withOpacity(.65),
      child: Container(
        height: 80,
        width: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              prayerName,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              prayerTime,
              style: Theme.of(context).textTheme.displaySmall,
            )
          ],
        ),
      ),
    );
  }
}
