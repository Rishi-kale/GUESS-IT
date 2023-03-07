import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CountDown extends StatefulWidget {
  final int countDown;
  final VoidCallback onFinish;

  CountDown({this.countDown = 5, required this.onFinish});

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown>
    with SingleTickerProviderStateMixin {
  // List<String> l = {'fast AND FUROIUS', 'tail of ghost', 'ted'} as List<String>;
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
                              'Mission impossible',
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
    // if (count == 0) {
    //    Navigator.push(context, MaterialPageRoute(builder: (context) => list()));

    // }
  }

  void dispose() {}
}
