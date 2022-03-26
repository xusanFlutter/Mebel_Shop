import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mebel_shop/home.dart';
import 'package:mebel_shop/register.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/third',
      routes: {
        '/': (context) => const Register(),
        '/second': (context) => const Home(),
        '/third': (context) => const LoadingScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const Intro()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 120,
            ),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.black),
            ),
            const SizedBox(height: 50,),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Create by Tolibov Husan',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Fast, reliableand saves time',
              body: 'The Worldsfirst platform',
              image: Center(
                child: Image.asset('assets/intro1.png'),
              ),
            ),
            PageViewModel(
              title: 'Live, eat and shoping',
              body: 'A read lives a thousand',
              image: Center(
                child: Image.asset('assets/intro2.png'),
              ),
            ),
          ],
          next: const Text(
            'Next',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          done: const Text(
            'Read',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          onDone: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const Register()));
          },
        ),
      ),
    );
  }
}
