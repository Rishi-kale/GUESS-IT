import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:guessit/data.dart';
import 'package:guessit/datab.dart';

class movies extends StatelessWidget {
  const movies({super.key, required Null Function() onFinish});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('BOLLYWOOD'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => bmovies(
                              onFinish: () {},
                            )));
              },
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: const Text('HOLLYWOOD'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CountDown(
                              onFinish: () {},
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
