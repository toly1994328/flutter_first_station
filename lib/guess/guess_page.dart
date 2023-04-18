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
  bool _guessing = false;


  @override
  void dispose() {
    _guessCtrl.dispose();
    super.dispose();
  }

  void _generateRandomValue() {
    setState(() {
      _guessing = true;
      _value = _random.nextInt(100);
      print(_value);
    });
  }

  TextEditingController _guessCtrl = TextEditingController();

  void _onCheck(){
    print("=====Check:目标数值:$_value=====${_guessCtrl.text}============");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuessAppBar(
        controller: _guessCtrl,
        onCheck: _onCheck,
      ),
      body: Stack(
        children: [
          // Column(
          //   children: [
          //     ResultNotice(color:Colors.redAccent,info:'大了'),
          //     ResultNotice(color:Colors.blueAccent,info:'小了'),
          //   ],
          // ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if(!_guessing)
                const Text('点击生成随机数值',),
                Text(
                  _guessing ? '**' : '$_value',
                  style: const TextStyle(fontSize: 68, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _guessing?null:_generateRandomValue,
        backgroundColor: _guessing ? Colors.grey : Colors.blue,
        tooltip: 'Increment',
        child: const Icon(Icons.generating_tokens_outlined),
      ),
    );
  }
}
