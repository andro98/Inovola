import 'package:inovola/inovola/model/core/course_model.dart';
// Contract class.
abstract class CourseHelper{
  Future<CourseModel> getCourse();
}