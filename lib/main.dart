import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop_multiwindow/base_window.dart';
import 'package:flutter_desktop_multiwindow/fuga_window.dart';
import 'package:flutter_desktop_multiwindow/hoge_window.dart';
import 'package:flutter_desktop_multiwindow/window_manager.dart';

void main() async {
  // run main method every time when create new window
  print("Run main");

  WidgetsFlutterBinding.ensureInitialized();
  var _key = await WindowController.lastWindowKey() ?? "";
  runApp(MyApp(windowKey: _key));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.windowKey}) : super(key: key);

  final String windowKey;

  @override
  Widget build(BuildContext context) {
    print(windowKey);
    if (windowKey == "base") {
      return MaterialApp(
        title: 'This is base window',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: BaseWindow(windowKey: Key(windowKey)),
      );
    } else if (windowKey == "hoge") {
      return MaterialApp(
        title: 'This is hoge window',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: HogeWindow(windowKey: Key(windowKey)),
      );
    } else {
      return MaterialApp(
        title: 'This is fuga window',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: FugaWindow(windowKey: Key(windowKey)),
      );
    }
  }
}
