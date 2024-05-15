import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../model/doctor_category.dart';

class CustomCatgoryModel extends StatelessWidget {
  const CustomCatgoryModel({super.key, required this.listCatgoryModel});
  final List<DoctorCategory> listCatgoryModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: listCatgoryModel.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            print(listCatgoryModel[index]);
          },
          child: SizedBox(
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                      color: grayColor, shape: BoxShape.circle),
                  child: Icon(
                    listCatgoryModel[index].icon,
                    color: blueColor,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${listCatgoryModel[index].name} $index",
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
