import 'package:doctor_booking/const/colors.dart';
import 'package:doctor_booking/model/doctor_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/doctor.dart';
import '../shared/widget/doctor_list_tile.dart';
import '../shared/widget/search_bar.dart';

class SearchSeeMore extends StatelessWidget {
  SearchSeeMore({super.key});

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text("Top Specialist"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                CustomSearchSection(),
                const SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: DoctorCategory.values
                        .map(
                          (category) => Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: category == DoctorCategory.dermatology
                                    ? redColor
                                    : grayColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              children: [
                                Icon(category.icon,
                                    color:
                                        category == DoctorCategory.dermatology
                                            ? whiteColor
                                            : black),
                                Text(
                                  category.name,
                                  style: TextStyle(
                                      color:
                                          category == DoctorCategory.dermatology
                                              ? whiteColor
                                              : black),
                                )
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomDoctorListTile(
          textTheme: textTheme,
          controller: controller,
          listDoctorModel: Doctor.sampleDoctors,
        ),
      ),
    );
  }
}
