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
      title: const Text("电子木鱼"),
      actions: [
        IconButton(
          onPressed: onTapHistory,
          icon: const Icon(Icons.history),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
