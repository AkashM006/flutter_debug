import 'package:flutter/material.dart';

class BorderedBoxWidget extends StatelessWidget {
  const BorderedBoxWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 2, color: Colors.red)),
      child: child,
    );
  }
}
