import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

const String kGuessSpKey = 'guess-config';
const String kMuYUSpKey = 'muyu-config';

class SpStorage {
  SpStorage._();

  static SpStorage? _storage;

  static SpStorage get instance {
    _storage = _storage ?? SpStorage._();
    return _storage!;
  }

  SharedPreferences? _sp;

  Future<void> initSpWhenNull() async {
    if (_sp != null) return;
    _sp = _sp ?? await SharedPreferences.getInstance();
  }

  Future<bool> saveGuessConfig({
    required bool guessing,
    required int value,
  }) async {
    await initSpWhenNull();
    String content = json.encode({'guessing': guessing, 'value': value});
    return _sp!.setString(kGuessSpKey, content);
  }

  Future<Map<String, dynamic>> readGuessConfig() async {
    await initSpWhenNull();
    String content = _sp!.getString(kGuessSpKey) ?? "{}";
    return json.decode(content);
  }

  Future<bool> saveMuYUConfig({
    required int counter,
    required int activeImageIndex,
    required int activeAudioIndex,
  }) async {
    await initSpWhenNull();
    String content = json.encode({
      'counter': counter,
      'activeImageIndex': activeImageIndex,
      'activeAudioIndex': activeAudioIndex,
    });
    return _sp!.setString(kMuYUSpKey, content);
  }

  Future<Map<String, dynamic>> readMuYUConfig() async {
    await initSpWhenNull();
    String content = _sp!.getString(kMuYUSpKey) ?? "{}";
    return json.decode(content);
  }
}
