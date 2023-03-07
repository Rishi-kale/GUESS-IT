import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:guessit/option.dart';

class bmovies extends StatefulWidget {
  final int countDown;
  final VoidCallback onFinish;

  bmovies({this.countDown = 5, required this.onFinish});

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<bmovies>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;
  late CountdownController _countdownController;

  @override
  void initState() {
    super.initState();
    _countdownController =
        CountdownController(widget.countDown, onFinish: widget.onFinish);
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _animation = StepTween(
      begin: widget.countDown,
      end: 0,
    ).animate(_controller)
      ..addListener(() {
        setState(() {
          _countdownController.updateCount(_animation.value);
        });
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _countdownController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text('GET READY'),
              ),
            ),
            body: Align(
                alignment: Alignment.center,
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('PUT ON YOUR HEAD',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        '${_animation.value}',
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      _animation.value == 0
                          ? Text(
                              'jolly llb',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            )
                          : Container(),
                    ])));
      },
    );
  }
}

class CountdownController {
  final int initialCount;
  late VoidCallback onFinish;

  CountdownController(this.initialCount, {required this.onFinish});

  void updateCount(int count) {
    if (count == 0) {}
  }

  void dispose() {}
}
