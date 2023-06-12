import 'package:day3/LogIn/login.dart';
import 'package:day3/Quiz/quiz.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'quiz': (context) => Quiz(), 'logIn': (context) => logIn()},
      theme: ThemeData(primarySwatch: Colors.pink),
      home: Scaffold(
        drawer: Builder(builder: (context) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.all(0),
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.pink),
                  child: Text('Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      )),
                ),
                ListTile(
                  leading: Icon(
                    Icons.quiz_rounded,
                    size: 40,
                  ),
                  title: Text(
                    'Quiz',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, 'quiz');
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.login,
                    size: 40,
                  ),
                  title: Text(
                    'Log in',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, 'logIn');
                  },
                )
              ],
            ),
          );
        }),
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home,
                size: 80,
              ),
              Text(
                'Home page',
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
        ),
      ),
    );
  }
}
