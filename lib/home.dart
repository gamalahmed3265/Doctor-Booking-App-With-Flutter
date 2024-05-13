import 'package:doctor_booking/const/colors.dart';
import 'package:doctor_booking/model/catgory.dart';
import 'package:flutter/material.dart';

import 'model/doctor.dart';

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
      ),
      body: ListView(
        controller: controller,
        padding: const EdgeInsets.all(15.0),
        children: [
          const CustomSearchSection(),
          const SparateWideget(),
          BodyTitle(
            textTheme: textTheme,
            text: "Doctor Specialist",
            onTap: () {
              print("object");
            },
          ),
          const SparateWideget(),
          const CustomCatgoryModel(),
          const SparateWideget(),
          BodyTitle(
            textTheme: textTheme,
            text: "My Schedule",
            onTap: () {
              print("object");
            },
          ),
          const SparateWideget(),
          CustomScheduleCard(textTheme: textTheme),
          const SparateWideget(),
          BodyTitle(
            textTheme: textTheme,
            text: "Top Specialist",
            onTap: () {
              print("object");
            },
          ),
          const SparateWideget(),
          CustomDoctorListTile(
            textTheme: textTheme,
            controller: controller,
            listDoctorModel: listDoctorModel,
          ),
        ],
      ),
    );
  }
}

class CustomDoctorListTile extends StatelessWidget {
  final List<DoctorModel> listDoctorModel;
  const CustomDoctorListTile(
      {super.key,
      required this.textTheme,
      required this.controller,
      required this.listDoctorModel});

  final TextTheme textTheme;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      controller: controller,
      itemCount: listDoctorModel.length,
      itemBuilder: (context, index) => const Divider(),
      separatorBuilder: (context, index) => ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: blueColor,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(5),
            child: Image.network(listDoctorModel[index].img)),
        title: Text(
          listDoctorModel[index].name,
          style: textTheme.titleLarge,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              listDoctorModel[index].specialization,
              style: textTheme.bodyMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.star_purple500_sharp,
                      color: yellowColor,
                    ),
                    Text(
                      listDoctorModel[index].stars.toString(),
                      style: textTheme.bodySmall,
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
                    ),
                    Text(
                      "${listDoctorModel[index].expertise} Years",
                      style: textTheme.bodySmall,
                    )
                  ],
                )
              ],
            )
          ],
        ),
        trailing: Container(
          width: 150,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: listDoctorModel[index].isBook ? grayColor : blueColor,
              borderRadius: BorderRadius.circular(15)),
          child: Text(
            listDoctorModel[index].isBook ? "UnBook" : "Book Now",
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              color: whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomScheduleCard extends StatelessWidget {
  const CustomScheduleCard({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: blueColor, borderRadius: BorderRadius.circular(15)),
      child: Column(
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
                    border: Border.all(color: whiteColor, width: 2)),
                padding: const EdgeInsets.all(5),
                child: const Icon(Icons.person)),
            title: Text(
              "Gamal",
              style: textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cardinly",
                  style: textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.star_purple500_sharp,
                          color: yellowColor,
                        ),
                        Text(
                          "4.5",
                          style:
                              textTheme.bodySmall?.copyWith(color: whiteColor),
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
                          style:
                              textTheme.bodySmall?.copyWith(color: whiteColor),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            trailing: const CircleAvatar(
              child: Icon(Icons.arrow_forward_ios_sharp),
            ),
          ),
          Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: blueColor2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.date_range,
                        color: black,
                      ),
                      Text(
                        "Tuesday, 30 Jan",
                        style: textTheme.bodySmall?.copyWith(color: black),
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
                        style: textTheme.bodySmall?.copyWith(color: black),
                      )
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}

class SparateWideget extends StatelessWidget {
  const SparateWideget({super.key, this.height = 30});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class CustomCatgoryModel extends StatelessWidget {
  const CustomCatgoryModel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: listCatgoryModel.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) => InkWell(
          onTap: listCatgoryModel[index].onTap,
          child: SizedBox(
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: grayColor, shape: BoxShape.circle),
                  child: Icon(
                    listCatgoryModel[index].icon,
                    color: blueColor,
                    size: 50,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${listCatgoryModel[index].title} $index",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

class CustomSearchSection extends StatelessWidget {
  const CustomSearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
            color: grayColor, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            const Icon(
              Icons.search_rounded,
              color: blueColor,
            ),
            const SizedBox(
              width: 15,
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  hintText: "Search Doctor..",
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: () {
                print("object");
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: black, borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.expand_circle_down_sharp,
                  color: blueColor,
                ),
              ),
            )
          ],
        ));
  }
}

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
