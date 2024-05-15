import 'package:flutter/material.dart';

class SplitWideget extends StatelessWidget {
  const SplitWideget({super.key, this.height = 30});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
