import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        titleTextStyle: const TextStyle(color: Colors.black),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("电子木鱼"),
        actions: [
          IconButton(onPressed: _toHistory, icon: const Icon(Icons.history))
        ],
      ),
      body: Column(
        children: [
          Expanded(child: _buildTopContent()),
          Expanded(child: _buildImage()),
        ],
      ),
    );
  }

  void _toHistory() {}

  Widget _buildTopContent() {
    final ButtonStyle style = ElevatedButton.styleFrom(
      minimumSize: const Size(36, 36),
      padding: EdgeInsets.zero,
      backgroundColor: Colors.green,
      elevation: 0,
    );

    return Stack(
      children: [
        Center(
          child: Text(
            '功德数: 0',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
            right: 10,
            top: 10,
            child: Wrap(
              spacing: 8,
              direction: Axis.vertical,
              children: [
                ElevatedButton(
                  style: style,
                  onPressed: () {},
                  child: Icon(Icons.music_note_outlined),
                ),
                ElevatedButton(
                  style: style,
                  onPressed: () {},
                  child: Icon(Icons.image),
                )
              ],
            )),
      ],
    );
  }

  Widget _buildImage() {
    return Center(
        child: Image.asset(
      'assets/images/muyu.png',
      height: 200,
    ));
  }
}
