import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MuyuAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onTapHistory;

  const MuyuAppBar({
    Key? key,
    required this.onTapHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent),
      backgroundColor: Colors.white,
      titleTextStyle: const TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      iconTheme: const IconThemeData(color: Colors.black),
      title: const Text("电子木鱼"),
      actions: [
        IconButton(onPressed: onTapHistory, icon: const Icon(Icons.history))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
