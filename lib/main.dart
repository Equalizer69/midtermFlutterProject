import 'package:flutter/material.dart';
import 'presentation/screens/homescreen.dart';
import 'presentation/screens/add_car.dart';
import 'presentation/screens/edit_car.dart';
import 'presentation/screens/detailed_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Midterm Exam',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const HomeScreen(),
      routes: {
        "/add_car": (context) => const AddCar(),
        "/edit_car": (context) => const EditCar(),
        "/details_car": (context) => const CarDetails(),
        "/home": (context) => const HomeScreen()
      },
    );
  }
}
