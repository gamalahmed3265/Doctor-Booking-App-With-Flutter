import 'package:doctor_booking/model/doctor_category.dart';
import 'package:flutter/material.dart';

import '../model/doctor.dart';
import '../shared/widget/catgory_model.dart';
import '../shared/widget/doctor_list_tile.dart';
import '../shared/widget/search_bar.dart';
import '../shared/widget/app_bar.dart';
import '../shared/widget/body_title.dart';
import '../shared/widget/schedule_card.dart';
import '../shared/widget/split_wideget.dart';
import 'search_see_more.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: CustomAppBar(textTheme: textTheme),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64.0),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomSearchSection(),
          ),
        ),
      ),
      body: ListView(
        controller: controller,
        padding: const EdgeInsets.all(15.0),
        children: [
          const SplitWideget(),
          BodyTitle(
            textTheme: textTheme,
            text: "Doctor Specialist",
            onTap: () {},
          ),
          const SplitWideget(),
          const CustomCatgoryModel(listCatgoryModel: DoctorCategory.values),
          const SplitWideget(),
          BodyTitle(
            textTheme: textTheme,
            text: "My Schedule",
            onTap: () {
              print("object");
            },
          ),
          const SplitWideget(),
          CustomScheduleCard(textTheme: textTheme),
          const SplitWideget(),
          BodyTitle(
            textTheme: textTheme,
            text: "Top Specialist",
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchSeeMore()));
            },
          ),
          const SplitWideget(),
          CustomDoctorListTile(
            textTheme: textTheme,
            controller: controller,
            listDoctorModel: Doctor.sampleDoctors,
          ),
        ],
      ),
    );
  }
}
