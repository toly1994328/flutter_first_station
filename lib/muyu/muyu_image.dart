import 'package:flutter/material.dart';

class MuyuAssetsImage extends StatelessWidget {
  final String image;

  const MuyuAssetsImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        image,
        height: 200,
      ),
    );
  }
}
