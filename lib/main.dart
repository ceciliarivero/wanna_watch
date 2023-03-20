import 'package:flutter/material.dart';

void main() {
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wanna Watch',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wanna Watch'),
        ),
      ),
    );
  }
}

