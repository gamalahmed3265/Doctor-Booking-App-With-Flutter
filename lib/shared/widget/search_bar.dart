import 'package:doctor_booking/const/colors.dart';
import 'package:doctor_booking/state/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchSection extends StatelessWidget {
  CustomSearchSection({
    super.key,
  });
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: grayColor, borderRadius: BorderRadius.circular(15)),
        child: TextFormField(
          controller: controller,
          onChanged: (value) {
            print("object");
            print(controller.text.length);
          },
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: "Search Doctor..",
              prefixIcon: controller.text != ""
                  ? InkWell(
                      onTap: () {
                        controller.text = "";
                      },
                      child: const Icon(
                        Icons.cancel_rounded,
                        color: blueColor,
                      ),
                    )
                  : const Icon(
                      Icons.search_rounded,
                      color: blueColor,
                    ),
              suffixIcon: InkWell(
                onTap: () {
                  BlocProvider.of<HomeBloc>(context).add(LoadHomeEvent());
                },
                child: Container(
                  margin: const EdgeInsets.all(4),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: black, borderRadius: BorderRadius.circular(8)),
                  child: const Icon(
                    Icons.filter_alt_outlined,
                    color: blueColor,
                  ),
                ),
              )),
        ));
  }
}
