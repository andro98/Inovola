import 'package:flutter/material.dart';
import 'package:inovola/inovola/model/core/course_model.dart';
import 'package:inovola/inovola/model/helper/course_helper.dart';
import 'package:inovola/inovola/model/services/course_service.dart';

enum Status { Loading, Error, Success }

class CourseProvider extends ChangeNotifier {
  CourseHelper _courseHelper = CourseService();
  CourseModel _courseModel;
  Status _status;
  String _errorMessage;

  String get errorMessage => _errorMessage;

  CourseModel get courseModel => _courseModel;

  Status get status => _status;

  Future<void> getCourses() async{
    _status = Status.Loading;
    try {
      final res = await _courseHelper.getCourse();
      _courseModel = res;
      _status = Status.Success;
    }catch(e){
      _errorMessage = e.toString();
      _status = Status.Error;
    }
    notifyListeners();
  }
}
