import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_first_station/muyu/muyu_image.dart';

import 'count_panel.dart';

class MuyuPage extends StatefulWidget {
  const MuyuPage({Key? key}) : super(key: key);

  @override
  State<MuyuPage> createState() => _MuyuPageState();
}

class _MuyuPageState extends State<MuyuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent),
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("电子木鱼"),
        actions: [
          IconButton(onPressed: _toHistory, icon: const Icon(Icons.history))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: CountPanel(
              count: 0,
              onTapSwitchAudio: _onTapSwitchAudio,
              onTapSwitchImage: _onTapSwitchImage,
            ),
          ),
          Expanded(
            child: MuyuAssetsImage(
              image: 'assets/images/muyu.png',
            ),
          ),
        ],
      ),
    );
  }

  void _toHistory() {}

  void _onTapSwitchAudio() {}

  void _onTapSwitchImage() {}
}
