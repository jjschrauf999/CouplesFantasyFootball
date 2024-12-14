import 'package:flutter/material.dart';
import 'welcome.dart';
import 'firebase.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'Flutter Demo',
            home: StartupFun(),
        );
  }
}

class StartupFun extends StatelessWidget {
  const StartupFun({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseClass().init(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Error();
        }
    
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Error();
          case ConnectionState.waiting:
            return Loading();
          case ConnectionState.active:
          case ConnectionState.done:
            return const MaterialApp(
              home: Welcome(),
            );
          default:
            throw Exception('Not implemented');
        }
      },
    );
  }
}

class Error extends StatelessWidget {
  const Error({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Error',
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
                children: <Widget>[Text('Error')])));
  }
}

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LOADING',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).pageHomeWelcome),
              backgroundColor: Colors.greenAccent[400],
            ),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text('LOADING')])));
  }
}
