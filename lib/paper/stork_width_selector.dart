import 'package:flutter/material.dart';

class StorkWidthSelector extends StatelessWidget {
  final List<double> supportStorkWidths;
  final ValueChanged<int> onSelect;
  final int activeIndex;
  final Color color;

  const StorkWidthSelector({
    Key? key,
    required this.supportStorkWidths,
    required this.activeIndex,
    required this.onSelect,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(
            supportStorkWidths.length,
            _buildByIndex,
          )),
    );
  }

  Widget _buildByIndex(int index) {
    bool select = index == activeIndex;
    return GestureDetector(
      onTap: () => onSelect(index),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        width: 70,
        height: 18,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: select ? Border.all(color: Colors.blue) : null),
        child: Container(
          width: 50,
          color: color,
          height: supportStorkWidths[index],
        ),
      ),
    );
  }
}
