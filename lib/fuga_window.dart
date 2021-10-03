import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop_multiwindow/window_manager.dart';

class FugaWindow extends StatefulWidget {
  const FugaWindow({Key? key, required this.windowKey}) : super(key: key);

  final Key windowKey;

  @override
  State<FugaWindow> createState() => _FugaWindowState();
}

class _FugaWindowState extends State<FugaWindow> {
  int _counter = 0;

  final hogeStyleForm = ElevatedButton.styleFrom(
    primary: Colors.green,
  );

  final baseStyleForm = ElevatedButton.styleFrom(
    primary: Colors.blue,
  );

  @override
  void initState() {
    super.initState();
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
              child: const Text('show base window'),
              style: baseStyleForm,
              onPressed: () async {
                await WindowController.showWindow("base");
              },
            ),
            SizedBox.fromSize(size: const Size.fromHeight(10)),
            ElevatedButton(
              child: const Text('hide base window'),
              style: baseStyleForm,
              onPressed: () async {
                await WindowController.hideWindow("base");
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
