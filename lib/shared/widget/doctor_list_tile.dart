import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../model/doctor.dart';
import '../../screens/book_appointment.dart';

class CustomDoctorListTile extends StatelessWidget {
  final List<Doctor> listDoctorModel;
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
      separatorBuilder: (context, index) => const Divider(
        color: grayColor,
        height: 24,
      ),
      itemBuilder: (context, index) => ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(listDoctorModel[index].profileImageUrl)),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(5),
        ),
        title: Text(
          listDoctorModel[index].name,
          style: textTheme.titleLarge,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              listDoctorModel[index].category.name,
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
                      listDoctorModel[index].rating.toString(),
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
                      color: blueColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "4.5 Years",
                      style: textTheme.bodySmall,
                    )
                  ],
                )
              ],
            )
          ],
        ),
        trailing: FilledButton(
          style: const ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
              backgroundColor: MaterialStatePropertyAll(blueColor)),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => BookAppointment(
                          doctor: listDoctorModel[index],
                        )));
          },
          child: Text(
            "Book Now",
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
