import 'package:doctor_booking/model/doctor.dart';
import 'package:doctor_booking/screens/doctor_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/colors.dart';
import '../../screens/book_appointment.dart';
import '../../state/home/home_bloc.dart';

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
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => ListView.separated(
              shrinkWrap: true,
              controller: controller,
              itemCount: state.nearbyDoctors.length,
              separatorBuilder: (context, index) => const Divider(
                color: grayColor,
                height: 24,
              ),
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => DoctorDetailsScreen(
                          doctorId: state.nearbyDoctors[index].id)));
                },
                contentPadding: const EdgeInsets.all(0),
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            state.nearbyDoctors[index].profileImageUrl)),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(5),
                ),
                title: Text(
                  state.nearbyDoctors[index].name,
                  style: textTheme.titleLarge,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.nearbyDoctors[index].category.name,
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
                              state.nearbyDoctors[index].rating.toString(),
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
                                  doctor: state.nearbyDoctors[index],
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
            ));
  }
}
