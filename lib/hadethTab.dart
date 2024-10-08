import 'package:flutter/material.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
