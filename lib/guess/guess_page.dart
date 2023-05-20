import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_first_station/storage/sp_storage.dart';
import 'guess_app_bar.dart';
import 'result_notice.dart';

class GuessPage extends StatefulWidget {
  const GuessPage({super.key});

  @override
  State<GuessPage> createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin{

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _initConfig();
  }

  void _initConfig() async{
    Map<String,dynamic> config = await SpStorage.instance.readGuessConfig();
    _guessing = config['guessing']??false;
    _value = config['value']??0;
    setState(() {

    });
  }

  int _value = 0;

  final Random _random = Random();
  bool _guessing = false;
  bool? _isBig;


  @override
  void dispose() {
    _guessCtrl.dispose();
    controller.dispose();
    super.dispose();
  }

  void _generateRandomValue() {
    setState(() {
      _guessing = true;
      _value = _random.nextInt(100);
      SpStorage.instance.saveGuessConfig(guessing: _guessing,value: _value);
      print(_value);
    });
  }

  TextEditingController _guessCtrl = TextEditingController();

  void _onCheck() {
    print("=====Check:目标数值:$_value=====${_guessCtrl.text}============");
    int? guessValue = int.tryParse(_guessCtrl.text);
    // 游戏未开始，或者输入非整数，无视
    if (!_guessing || guessValue == null) return;
    controller.forward(from: 0);
    //猜对了
    if (guessValue == _value) {
      setState(() {
        _isBig = null;
        _guessing = false;
        SpStorage.instance.saveGuessConfig(guessing: _guessing,value: _value);
      });
      return;
    }
    // 猜错了
    setState(() {
      _isBig = guessValue > _value;
    });
    _guessCtrl.clear();
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
          if(_isBig!=null)
          Column(
            children: [
              if(_isBig!)
              ResultNotice(color:Colors.redAccent,info:'大了',controller: controller,),
              Spacer(),
              if(!_isBig!)
              ResultNotice(color:Colors.blueAccent,info:'小了',controller: controller,),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (!_guessing)
                  const Text(
                    '点击生成随机数值',
                  ),
                Text(
                  _guessing ? '**' : '$_value',
                  style: const TextStyle(
                      fontSize: 68, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _guessing ? null : _generateRandomValue,
        backgroundColor: _guessing ? Colors.grey : Colors.blue,
        tooltip: 'Increment',
        child: const Icon(Icons.generating_tokens_outlined),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


}
