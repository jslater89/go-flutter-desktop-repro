import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:worker_manager/worker_manager.dart';


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
  CrossFadeState _backgroundState = CrossFadeState.showFirst;
  FocusNode _mainFocus = FocusNode();

  late Timer t;

  late Image image1;
  late Image image2;
  late Image image3;
  late Image image4;

  @override
  void initState() {
    super.initState();
    Executor().warmUp(isolatesCount: 4);

    // Wait a few seconds and try to quit.
    Future.delayed(const Duration(seconds: 2), () => SystemNavigator.pop());
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      autofocus: true,
      focusNode: _mainFocus,
      child: Stack(
        children: [
          Container(
            key: Key("bg1"),
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
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.brown[300]!.withAlpha(128),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: Text("Debug Menu"),
                        onPressed: () {
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        child: Text("Exit"),
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.2)
                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}