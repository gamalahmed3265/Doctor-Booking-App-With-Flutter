import 'package:doctor_booking/const/colors.dart';
import 'package:flutter/material.dart';

import '../screens/home.dart';
// import '../shared/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true, primaryColor: blueColor),
      home: MyHomePage(),
    );
  }
}
