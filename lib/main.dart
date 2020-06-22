import 'package:flutter/material.dart';
import 'package:inovola/inovola/controller/provider/course_provider.dart';
import 'package:inovola/inovola/view/pages/course_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inovola',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
          create: (_) => CourseProvider(), child: CoursePage()),
    );
  }
}
