import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:inovola/inovola/model/core/course_model.dart';
import 'package:inovola/inovola/model/helper/course_helper.dart';

class CourseService extends CourseHelper {
  Future<CourseModel> getCourse() async {
    try {
      final String url =
          'https://run.mocky.io/v3/3a1ec9ff-6a95-43cf-8be7-f5daa2122a34';

      final response = await http.get(url);
      if (response.statusCode == 200) {
        return CourseModel.fromJson(convert.jsonDecode(response.body));
      } else {
        throw ("Request failed with status: ${response.statusCode}.");
      }
    } catch (e) {
      throw ("Request failed with unknow error!");
    }
  }
}
