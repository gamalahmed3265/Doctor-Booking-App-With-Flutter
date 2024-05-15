import 'package:flutter/material.dart';

import '../../const/colors.dart';

class BodyTitle extends StatelessWidget {
  const BodyTitle(
      {super.key,
      required this.textTheme,
      required this.text,
      required this.onTap});

  final TextTheme textTheme;
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: textTheme.titleLarge,
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: redColor, width: 1))),
            child: Text(
              "See All",
              style: textTheme.bodyMedium?.copyWith(
                color: redColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
