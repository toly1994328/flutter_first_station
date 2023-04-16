import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'guess_app_bar.dart';
import 'result_notice.dart';

class GuessPage extends StatefulWidget {
  const GuessPage({super.key, required this.title});

  final String title;

  @override
  State<GuessPage> createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  int _value = 0;

  Random _random = Random();

  void _generateRandomValue() {
    setState(() {
      _value = _random.nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuessAppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              ResultNotice(color:Colors.redAccent,info:'大了'),
              ResultNotice(color:Colors.blueAccent,info:'小了'),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  '点击生成随机数值',
                ),
                Text(
                  '$_value',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateRandomValue,
        tooltip: 'Increment',
        child: const Icon(Icons.generating_tokens_outlined),
      ),
    );
  }
}
