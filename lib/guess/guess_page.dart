import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      appBar:
      AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent
        ),
        // leadingWidth: 54,
        titleSpacing: 0,

        leading: Icon(Icons.menu, color: Colors.black,),
        actions: [
          IconButton(
              splashRadius: 20,
              onPressed: (){}, icon: Icon(
            Icons.run_circle_outlined,
            color: Colors.blue,
          ))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        title:
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffF3F6F9),
              constraints: BoxConstraints(maxHeight: 35),
              border: UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              hintText: "输入 0~99 数字",
              hintStyle: TextStyle(fontSize: 14)),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
                Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.redAccent,
                      child: Text(
                        '大了',
                        style: TextStyle(
                            fontSize: 54,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              // Spacer(),
              Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.blueAccent,
                    child: Text(
                      '小了',
                      style: TextStyle(
                          fontSize: 54,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('点击生成随机数值',),
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