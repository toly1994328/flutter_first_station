import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

import '../models/audio_option.dart';

class AudioOptionPanel extends StatelessWidget {
  final List<AudioOption> audioOptions;
  final ValueChanged<int> onSelect;
  final int activeIndex;

  const AudioOptionPanel({
    Key? key,
    required this.audioOptions,
    required this.activeIndex,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle labelStyle =
        TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    return Material(
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            Container(
                height: 46,
                alignment: Alignment.center,
                child: const Text(
                  "选择音效",
                  style: labelStyle,
                )),
            ...List.generate(audioOptions.length, _buildByIndex)
          ],
        ),
      ),
    );
  }

  Widget _buildByIndex(int index) {
    bool active = index == activeIndex;
    return ListTile(
      selected: active,
      onTap: () => onSelect(index),
      title: Text(audioOptions[index].name),
      trailing: IconButton(
        splashRadius: 20,
        onPressed: ()=>_tempPlay(audioOptions[index].src),
        icon: const Icon(
          Icons.record_voice_over_rounded,
          color: Colors.blue,
        ),
      ),
    );
  }

  void _tempPlay(String src) async{
    AudioPool pool = await FlameAudio.createPool(src, maxPlayers: 1);
    pool.start();
  }
}
