import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_task/widgets/add_new_text.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _screenText = 'Hey there';
  late Color _backColor;
  final Random random = Random();

  Color _generateRandomColor() {
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      random.nextDouble(),
    );
  }

  void _startAddNewText(String txt) {
    showModalBottomSheet(
      context: context,
      builder: (_) => AddNewText(function: _fatchNewText),
    );
  }

  void _fatchNewText(String newText) {
    setState(() {
      _screenText = newText;
    });
  }

  @override
  void initState() {
    _backColor = _generateRandomColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _backColor = _generateRandomColor();
        });
      },
      child: Scaffold(
        backgroundColor: _backColor,
        appBar: AppBar(
          title: const Text('Color App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  _screenText,
                  style: const TextStyle(color: Colors.white, fontSize: 26),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _startAddNewText(_screenText),
                child: const Text(
                  'Edit Text',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
