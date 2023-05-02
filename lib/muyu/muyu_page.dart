import 'dart:math';

import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_station/muyu/animate_text.dart';
import 'models/image_option.dart';
import 'muyu_image.dart';

import 'count_panel.dart';
import 'muyu_app_bar.dart';
import 'options/select_image.dart';

class MuyuPage extends StatefulWidget {
  const MuyuPage({Key? key}) : super(key: key);

  @override
  State<MuyuPage> createState() => _MuyuPageState();
}

class _MuyuPageState extends State<MuyuPage> {
  int _counter = 0;
  int _cruValue = 0;
  int _activeImageIndex = 0;

  final Random _random = Random();

  final List<ImageOption> imageOptions = const [
    ImageOption('基础版', 'assets/images/muyu.png', 1, 3),
    ImageOption('尊享版', 'assets/images/muyu2.png', 3, 6),
  ];

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
                  image: activeImage,
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

  void _onTapSwitchImage() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return ImageOptionPanel(
          imageOptions: imageOptions,
          activeIndex: _activeImageIndex,
          onSelect: _onSelectImage,
        );
      },
    );
  }

  void _onKnock() {
    pool?.start();
    setState(() {
      _cruValue = knockValue;
      _counter += _cruValue;
    });
  }

  String get activeImage => imageOptions[_activeImageIndex].src;

  int get knockValue {
    int min = imageOptions[_activeImageIndex].min;
    int max = imageOptions[_activeImageIndex].max;
    return min + _random.nextInt(max+1 - min);
  }


  void _onSelectImage(int value) {
    Navigator.of(context).pop();
    if(value == _activeImageIndex) return;
    setState(() {
      _activeImageIndex = value;
    });
  }
}
