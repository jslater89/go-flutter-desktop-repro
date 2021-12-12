import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.brown,
      ),
      home: const MainMenu(),
    );
  }
}

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final FocusNode _mainFocus = FocusNode();

  @override
  void initState() {
    super.initState();

    compute((_) async {
      await(Future.delayed(const Duration(days: 365)));
    }, null);

    // Wait a few seconds and try to quit.
    // Future.delayed(const Duration(seconds: 2), () => SystemNavigator.pop());
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      autofocus: true,
      focusNode: _mainFocus,
      child: Stack(
        children: [
          Container(
            key: const Key("bg1"),
            height: double.infinity,
            width: double.infinity,
            child: FittedBox(
              child: Image.asset("assets/graphics/menubg1.jpg", bundle: rootBundle,),
              fit: BoxFit.cover,
            ),
          ),
          Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: const Text("Exit"),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                    ),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}