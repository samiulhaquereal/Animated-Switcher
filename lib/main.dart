import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: Text(
                  '${_count}',
                  style: TextStyle(fontSize: 50),
                  key: ValueKey(_count),
                ),
              transitionBuilder: (Widget child,Animation<double> animation){
                  return ScaleTransition(scale: animation,child: child,);
              },
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _count += 1;
                  });
                },
                child: Text('Click Here'))
          ],
        ),
      ),
    );
  }
}
