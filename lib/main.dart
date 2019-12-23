import 'package:flutter/material.dart';

void main() => runApp(XpenseApp());

class XpenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xpense - Personal Expense App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xpense'),
      ),
      body: Text('Body goes here')
    );
  }
}
