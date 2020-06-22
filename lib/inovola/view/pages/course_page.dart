import 'package:flutter/material.dart';
import 'package:inovola/inovola/model/helper/course_helper.dart';
import 'package:inovola/inovola/model/services/course_service.dart';

class CoursePage extends StatelessWidget {
  CourseHelper courseHelper = CourseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: FlatButton(
        onPressed: () async {
          final res = await courseHelper.getCourse();
          print(res.title);
        },
        child: Text('Click!!'),
      )),
    );
  }
}
