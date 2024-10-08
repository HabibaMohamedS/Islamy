import 'package:flutter/material.dart';

class SebhaTAb extends StatefulWidget {
  const SebhaTAb({super.key});

  @override
  State<SebhaTAb> createState() => _SebhaTAbState();
}

class _SebhaTAbState extends State<SebhaTAb> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/head_sebha_logo.png'),
            Image.asset('assets/images/body_sebha_logo.png'),
            SizedBox(
              height: 30,
            ),
            Text(
              'عدد التسبيحات',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 50,
              height: 60,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 189, 168, 130),
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10), bottom: Radius.circular(10))),
              child: Text(
                counter.toString(),
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)))),
              onPressed: () {
                counter++;
                setState(() {});
              },
              child: Text(
                "سبحان الله",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
