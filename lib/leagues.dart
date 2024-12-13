import 'package:flutter/material.dart';
import 'package:flutter_app/welcome.dart';

class Leagues extends StatelessWidget {
  const Leagues({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Leagues'),
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
                          builder: (context) => const Welcome(),
                        ),
                      );
                    },
                    child: const Text('Back'),
                  ),
                ]))
// home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}
