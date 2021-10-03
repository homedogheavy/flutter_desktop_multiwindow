import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop_multiwindow/window_manager.dart';

class BaseWindow extends StatefulWidget {
  const BaseWindow({Key? key, required this.windowKey}) : super(key: key);

  final Key windowKey;

  @override
  State<BaseWindow> createState() => _BaseWindowState();
}

class _BaseWindowState extends State<BaseWindow> {
  int _counter = 0;

  final hogeStyleForm = ElevatedButton.styleFrom(
    primary: Colors.green,
  );

  final fugaStyleForm = ElevatedButton.styleFrom(
    primary: Colors.red,
  );

  @override
  void initState() {
    super.initState();
    () async {
      await WindowController.createWindow(
        "hoge",
        offset: const Offset(400, 250),
        size: Size(300, 300),
      );
      await WindowController.createWindow(
        "fuga",
        offset: const Offset(100, 100),
        size: Size(300, 300),
      );
    }();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${(widget.windowKey as ValueKey).value} window"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${(widget.windowKey as ValueKey).value} count:"),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              child: const Text('show hoge window'),
              style: hogeStyleForm,
              onPressed: () async {
                await WindowController.showWindow("hoge");
              },
            ),
            SizedBox.fromSize(size: const Size.fromHeight(10)),
            ElevatedButton(
              child: const Text('hide hoge window'),
              style: hogeStyleForm,
              onPressed: () async {
                await WindowController.hideWindow("hoge");
              },
            ),
            SizedBox.fromSize(size: const Size.fromHeight(10)),
            ElevatedButton(
              child: const Text('show fuga window'),
              style: fugaStyleForm,
              onPressed: () async {
                await WindowController.showWindow("fuga");
              },
            ),
            SizedBox.fromSize(size: const Size.fromHeight(10)),
            ElevatedButton(
              child: const Text('hide fuga window'),
              style: fugaStyleForm,
              onPressed: () async {
                await WindowController.hideWindow("fuga");
              },
            ),
            SizedBox.fromSize(size: const Size.fromHeight(10)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
