import 'package:flutter/material.dart';

import '../../const/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Welcome",
          style: textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 4.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Gamal",
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
            const Icon(Icons.notifications_none),
          ],
        ),
        InkWell(
          onTap: () {
            print("object");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.pin_drop,
                size: 15,
                color: redColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text("New Work USA",
                  style: textTheme.bodySmall!.copyWith(
                    color: redColor,
                  )),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.arrow_drop_down_rounded,
                size: 15,
                color: redColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
