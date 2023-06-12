import 'package:day3/LogIn/afterLogIn.dart';
import 'package:day3/LogIn/dataModel.dart';
import 'package:day3/Quiz/quiz.dart';
import 'package:flutter/material.dart';

class logIn extends StatefulWidget {
  const logIn({super.key});

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  @override
  Widget build(BuildContext context) {
    User u = User(name: 'name', pass: 'pass');
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'quiz': (context) => Quiz(),
          'logIn': (context) => logIn(),
          'afterLogIn': (context) => afterLogIn()
        },
        title: 'Home',
        theme: ThemeData(primarySwatch: Colors.pink),
        home: SafeArea(
          child: Scaffold(
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
              title: Text('Log in'),
            ),
            body: Builder(builder: (context) {
              return Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people,
                        size: 100,
                      ),
                      Container(
                          width: 100,
                          height: 70,
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(20),
                          child: TextField(
                            onChanged: (value) => {
                              u.name = value,
                            },
                            decoration:
                                InputDecoration(hintText: 'Enter your name'),
                          )),
                      Container(
                        width: 100,
                        height: 70,
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(20),
                        child: TextField(
                          obscureText: true,
                          onChanged: (value) => {
                            u.password = value,
                          },
                          decoration:
                              InputDecoration(hintText: 'Enter your password'),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 55,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(20),
                        child: Center(
                            child: ElevatedButton(
                                onPressed: () => {
                                      Navigator.pushNamed(context, 'afterLogIn',
                                          arguments: [u.name, u.password])
                                    },
                                child: Text("Log in",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30)))),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ));
  }
}
