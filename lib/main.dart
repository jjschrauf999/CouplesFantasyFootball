import 'package:flutter/material.dart';
import 'package:flutter_app/firebase_options.dart';
import 'welcome.dart';
import 'authentication.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApplicationState().init(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return MaterialApp(
              title: 'Welcome',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: Scaffold(
                  appBar: AppBar(
                    title: const Text('Error'),
                    backgroundColor: Colors.greenAccent[400],
                  ),
                  body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[Text('Error')]))
              // home: const MyHomePage(title: 'Flutter Demo Home Page'),
              );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return const MaterialApp(
            home: Welcome(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
            title: 'Welcome',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Scaffold(
                appBar: AppBar(
                  title: const Text('Loading'),
                  backgroundColor: Colors.greenAccent[400],
                ),
                body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Text('Loading')]))
            // home: const MyHomePage(title: 'Flutter Demo Home Page'),
            );
      },
    );
  }
}
