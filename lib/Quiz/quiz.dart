import 'package:day3/LogIn/logIn.dart';
import 'package:day3/Quiz/score.dart';
import 'package:flutter/material.dart';

import 'questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  QuestionsBank q = QuestionsBank();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz application',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      routes: {
        'quiz': (context) => Quiz(),
        'logIn': (context) => logIn(),
        'score': (context) => ScoreScreen()
      },
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
          title: Text('Quiz application'),
        ),
        body: Builder(builder: (context) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 30),
                child: ListTile(
                  leading: Text(
                    (q.index + 1).toString(),
                    style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  title: Text(
                    q.showQuestion().text,
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 18,
                    ),
                  ),
                  trailing: Visibility(
                    visible: q.index > 0,
                    child: Icon(
                      q.isCorrect ? Icons.check : Icons.close,
                      color: q.isCorrect ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: !q.inRange
                        ? null
                        : () {
                            if (!q.inRange) {
                              Navigator.pushNamed(context, 'score',
                                  arguments: q.getScore());
                            } else {
                              q.checkAnswer(true);
                              q.moveQuestion();
                              setState(() {});
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                    ),
                    child: Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: !q.inRange
                        ? null
                        : () {
                            if (!q.inRange) {
                              Navigator.pushNamed(context, 'score',
                                  arguments: q.getScore());
                            } else {
                              q.checkAnswer(false);
                              q.moveQuestion();
                              setState(() {});
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                    ),
                    child: Text(
                      'False',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      q.getScore().toString(),
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Visibility(
                      visible: !q.inRange,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'score',
                              arguments: q.getScore());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                        ),
                        child: Text(
                          'View Score',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
