import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  static const id = 'counter';

  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter2 = 0;
  int counter = 0;

  @override
  initState() {
    super.initState();
    counter2 = loadCounter();
    counter = loadCounter();
  }

  int loadCounter() {
    return 5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(counter.toString()),
            Text(counter2.toString()),
            TextButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: Text('Incrementa 1'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  counter2++;
                });
              },
              child: Text('Decrementa 2'),
            ),
          ],
        ),
      ),
    );
  }
}
