import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/radio_image.png'),
            SizedBox(
              height: 20,
            ),
            Text(
              'إذاعة القرآن الكريم',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.skip_previous,
                    color: Theme.of(context).primaryColor,
                    size: 50,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.play_arrow_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 60,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.skip_next,
                    color: Theme.of(context).primaryColor,
                    size: 50,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
