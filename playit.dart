import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:guessit/option.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('GUESS IT'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('PLAY'),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => movies(
                          onFinish: () {},
                        )));
          },
        ),
      ),
    ));
  }
}
