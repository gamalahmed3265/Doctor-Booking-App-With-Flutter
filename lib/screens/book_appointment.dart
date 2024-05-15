import 'package:doctor_booking/const/colors.dart';
import 'package:doctor_booking/model/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookAppointment extends StatelessWidget {
  const BookAppointment({super.key, required this.doctor});

  final Doctor doctor;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Appointment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(doctor.profileImageUrl)),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(5),
              ),
              title: Text(
                doctor.name,
                style: textTheme.titleLarge,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.category.name,
                    style: textTheme.bodyMedium,
                  ),
                  Text(doctor.address.country)
                ],
              ),
            ),
            Divider(
              color: black.withOpacity(.25),
              height: 24,
            ),
            Text(
              "Select Date",
              style: textTheme.titleMedium,
            ),
            Container(
              height: 100,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: grayColor, borderRadius: BorderRadius.circular(15)),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Jan",
                    // style: textTheme.titleMedium?.copyWith(color: whiteColor),
                  ),
                  Text(
                    "30",
                    // style: textTheme.titleMedium?.copyWith(color: whiteColor),
                  ),
                ],
              ),
            ),
            Divider(
              color: black.withOpacity(.25),
              height: 24,
            ),
            Text(
              "Select Time",
              style: textTheme.titleMedium,
            ),
            Row(
              children: [
                FilledButton(
                  style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                      backgroundColor: MaterialStatePropertyAll(grayColor)),
                  onPressed: () {},
                  child: Text(
                    "9 PM",
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium?.copyWith(),
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                    backgroundColor: MaterialStatePropertyAll(blueColor)),
                onPressed: () {},
                child: Text(
                  "Next",
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(
                    color: whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
