import 'package:flutter/material.dart';

class afterLogIn extends StatefulWidget {
  const afterLogIn({super.key});

  @override
  State<afterLogIn> createState() => _afterLogInState();
}

class _afterLogInState extends State<afterLogIn> {
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments as List<dynamic>?;
    String name = data?[0] as String;
    String pass = data?[1] as String;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Log in',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello user'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 500,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Your Name is: $name',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Your Password: is $pass',
                      style: TextStyle(fontSize: 20),
                    )
                  ]),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back', style: TextStyle(fontSize: 30)))
          ],
        ),
      ),
    );
  }
}
