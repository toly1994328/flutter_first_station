import 'package:flutter/material.dart';
import 'package:flutter_first_station/guess/guess_page.dart';
import 'package:flutter_first_station/muyu/muyu_page.dart';
import 'package:flutter_first_station/paper/paper.dart';

import 'app_bottom_bar.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({Key? key}) : super(key: key);

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _index = 0;

  final List<MenuData> menus = const [
    MenuData(label: '猜数字', icon: Icons.question_mark),
    MenuData(label: '电子木鱼', icon: Icons.my_library_music_outlined),
    MenuData(label: '白板绘制', icon: Icons.palette_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _buildContent(_index),
        ),
        AppBottomBar(
          currentIndex: _index,
          onItemTap: _onChangePage,
          menus: menus,
        )
      ],
    );
  }

  void _onChangePage(int index) {
    setState(() {
      _index = index;
    });
  }

  Widget _buildContent(int index) {
    switch(index){
      case 0:
       return const GuessPage();
      case 1:
        return const MuyuPage();
      case 2:
        return const Paper();
      default:
        return const SizedBox.shrink();
    }
  }
}

