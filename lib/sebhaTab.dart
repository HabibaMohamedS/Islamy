import 'package:flutter/material.dart';

class SebhaTAb extends StatefulWidget {
  const SebhaTAb({super.key});

  @override
  State<SebhaTAb> createState() => _SebhaTAbState();
}

class _SebhaTAbState extends State<SebhaTAb>
    with SingleTickerProviderStateMixin {
  int counter = 0;
  int index = 0;
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  List<String> tsbeh = [
    "سبحان الله",
    'الحمد لله',
    "لا اله الا الله",
    "الله اكبر"
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: -75,
                    left: 90,
                    child: Image.asset('assets/images/head_sebha_logo.png'),
                  ),
                  RotationTransition(
                      turns: Tween(begin: 0.0, end: 10.0 / 360.0)
                          .animate(_controller!),
                      child: Image.asset('assets/images/body_sebha_logo.png'))
                ],
              ),
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
                    color:
                        Theme.of(context).colorScheme.onPrimary.withOpacity(.5),
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10), bottom: Radius.circular(10))),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    counter.toString(),
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
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
                  _controller?.forward(from: 0.0);
                  counter++;
                  if (counter % 33 == 0) {
                    if (index < 3) {
                      index++;
                    } else {
                      index = 0;
                    }
                  }
                  setState(() {});
                },
                child: Text(
                  tsbeh[index],
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
