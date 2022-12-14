import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: isActive ? 10 : 4,
        width: 4,
        decoration: BoxDecoration(
            color: isActive
            // color: isActive ? primaryColor : primaryColor.withOpacity(0.4)
                ? Colors.redAccent
                : Colors.redAccent.withOpacity(0.4),
            borderRadius: const BorderRadius.all(Radius.circular(12))));
  }
}