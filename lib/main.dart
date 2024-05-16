import 'package:flutter/material.dart';

import 'app/app.dart';
import 'repositories/doctor_repository.dart';

void main() async {
  final doctorRepository = DoctorRepository();
  runApp(MyApp(doctorRepository: doctorRepository));
}
