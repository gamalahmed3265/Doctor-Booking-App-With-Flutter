import 'package:doctor_booking/utils/colors.dart';
import 'package:doctor_booking/state/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/doctor_repository.dart';
import '../screens/home.dart';
// import '../shared/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.doctorRepository});
  final DoctorRepository doctorRepository;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider.value(value: doctorRepository)],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => HomeBloc(doctorRepository: doctorRepository)
                ..add(LoadHomeEvent()))
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(useMaterial3: true, primaryColor: blueColor),
          home: MyHomePage(),
        ),
      ),
    );
  }
}
