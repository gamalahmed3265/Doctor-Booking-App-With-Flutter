import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../const/colors.dart';

class CustomScheduleCard extends StatelessWidget {
  const CustomScheduleCard({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 200,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [blueColor, blueColor2]),
                borderRadius: BorderRadius.circular(15)),
            child: true
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: blueColor,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: whiteColor, width: 2)),
                            padding: const EdgeInsets.all(5),
                            child: const Icon(Icons.person)),
                        title: Text(
                          "Gamal",
                          style: textTheme.titleLarge
                              ?.copyWith(color: Colors.white),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cardinly",
                              style: textTheme.bodyMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.star_purple500_sharp,
                                      color: yellowColor,
                                    ),
                                    Text(
                                      "4.5",
                                      style: textTheme.bodySmall
                                          ?.copyWith(color: whiteColor),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.date_range_outlined,
                                      color: whiteColor,
                                    ),
                                    Text(
                                      "Years",
                                      style: textTheme.bodySmall
                                          ?.copyWith(color: whiteColor),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        trailing: const CircleAvatar(
                          backgroundColor: blueColor2,
                          child: Icon(Icons.arrow_forward_ios_sharp,
                              color: whiteColor),
                        ),
                      ),
                      Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: blueColor2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.date_range,
                                    color: black,
                                  ),
                                  Text(
                                    "Tuesday, 30 Jan",
                                    style: textTheme.bodySmall
                                        ?.copyWith(color: black),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "|",
                                style: TextStyle(color: black),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_alarms_outlined,
                                    color: black,
                                  ),
                                  Text(
                                    "03:29 PM",
                                    style: textTheme.bodySmall
                                        ?.copyWith(color: black),
                                  )
                                ],
                              )
                            ],
                          ))
                    ],
                  )
                // ignore: dead_code
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "No Appointment added yet",
                        style: textTheme.titleMedium?.copyWith(
                            color: whiteColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
        Container(
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
              color: blueColor.withOpacity(0.25),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(8))),
        ),
        Container(
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
              color: blueColor.withOpacity(0.15),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(8))),
        )
      ],
    );
  }
}
