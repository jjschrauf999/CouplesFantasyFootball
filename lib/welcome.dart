import 'package:flutter/material.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter_app/signup.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Welcome'),
              backgroundColor: Colors.greenAccent[400],
            ),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FilledButton(
                    style: FilledButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                    child: const Text('Login'),
                  ),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Signup(),
                        ),
                      );
                    },
                    child: const Text('Signup'),
                  )
                ]))
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}
