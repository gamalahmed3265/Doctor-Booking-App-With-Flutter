import 'package:doctor_booking/state/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/doctor.dart';
import '../shared/widget/bottom_nav_bars.dart';
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
    return Scaffold(
        bottomNavigationBar: const MainNavBar(),
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
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            print(state);
            if (state.status == HomeStatus.loading ||
                state.status == HomeStatus.initial) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == HomeStatus.loaded) {
              return ListView(
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
                  CustomCatgoryModel(listCatgoryModel: state.doctorCategories),
                  const SplitWideget(),
                  BodyTitle(
                    textTheme: textTheme,
                    text: "My Schedule",
                    onTap: () {
                      print("object");
                    },
                  ),
                  const SplitWideget(),
                  const CustomScheduleCard(),
                  const SplitWideget(),
                  BodyTitle(
                    textTheme: textTheme,
                    text: "Top Specialist",
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => SearchSeeMore()));
                    },
                  ),
                  const SplitWideget(),
                  CustomDoctorListTile(
                    textTheme: textTheme,
                    controller: controller,
                    listDoctorModel: Doctor.sampleDoctors,
                  ),
                ],
              );
            }
            return const Center(child: Text("Error Loading a Data"));
          },
        ));
  }
}
