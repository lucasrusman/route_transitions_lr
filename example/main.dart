import 'package:flutter/material.dart';
import 'package:route_transitions_lr/route_transitions_lr.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'page1',
      routes: {'page1': (_) => const Page1(), 'page2': (_) => const Page2()},
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page1'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blue,
      body: Center(
          child: MaterialButton(
        onPressed: () {
          Routetransitions(
            context: context,
            child: const Page2(),
            animation: AnimationType.fadeIn,
            duration: const Duration(seconds: 1),
            replacement: true,
          );
        },
        color: Colors.white,
        child: const Text('Go to page2'),
      )),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page1'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blueGrey,
      body: const Center(
        child: Text('Page2'),
      ),
    );
  }
}
