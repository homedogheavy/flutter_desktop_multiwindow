import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_desktop_multiwindow/window_manager.dart';

class HogeWindow extends StatefulWidget {
  const HogeWindow({Key? key, required this.windowKey}) : super(key: key);

  final Key windowKey;

  @override
  State<HogeWindow> createState() => _HogeWindowState();
}

class _HogeWindowState extends State<HogeWindow> {
  int _counter = 0;

  final baseStyleForm = ElevatedButton.styleFrom(
    primary: Colors.blue,
  );

  final fugaStyleForm = ElevatedButton.styleFrom(
    primary: Colors.red,
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
