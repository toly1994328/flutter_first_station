import 'dart:math';

import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_station/muyu/animate_text.dart';
import 'muyu_image.dart';

import 'count_panel.dart';
import 'muyu_app_bar.dart';

class MuyuPage extends StatefulWidget {
  const MuyuPage({Key? key}) : super(key: key);

  @override
  State<MuyuPage> createState() => _MuyuPageState();
}

class _MuyuPageState extends State<MuyuPage> {
  int _counter = 0;
  int _cruValue = 0;

  final Random _random = Random();

  AudioPool? pool;

  @override
  void initState() {
    super.initState();
    _initAudioPool();
  }

  void _initAudioPool() async {
    pool = await FlameAudio.createPool(
      'muyu_1.mp3',
      maxPlayers: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MuyuAppBar(
        onTapHistory: _toHistory,
      ),
      body: Column(
        children: [
          Expanded(
            child: CountPanel(
              count: _counter,
              onTapSwitchAudio: _onTapSwitchAudio,
              onTapSwitchImage: _onTapSwitchImage,
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                MuyuAssetsImage(
                  image: 'assets/images/muyu.png',
                  onTap: _onKnock,
                ),
                if (_cruValue != 0) AnimateText(text: '功德+$_cruValue')
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _toHistory() {}

  void _onTapSwitchAudio() {}

  void _onTapSwitchImage() {}

  void _onKnock() {
    pool?.start();
    setState(() {
      _cruValue = 1 + _random.nextInt(3);
      _counter += _cruValue;
    });
  }
}
