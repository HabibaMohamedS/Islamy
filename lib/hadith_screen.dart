import 'package:flutter/material.dart';
import 'package:islamy/hadethTab.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});
  static String routName = 'hadithScreen';
  @override
  Widget build(BuildContext context) {
    Hadeth hadethModel = ModalRoute.of(context)!.settings.arguments as Hadeth;
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
                  hadethModel.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Divider(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      hadethModel.content,
                      style: Theme.of(context).textTheme.titleSmall,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
