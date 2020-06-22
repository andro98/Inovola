import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inovola/config/Styles.dart';
import 'package:inovola/inovola/controller/provider/course_provider.dart';
import 'package:inovola/inovola/model/core/course_model.dart';
import 'package:inovola/inovola/view/widgets/success_widget.dart';
import 'package:provider/provider.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<CourseProvider>(context, listen: false).getCourses();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          Provider.of<CourseProvider>(context, listen: false).getCourses();
        },
        child: Container(
          width: size.width,
          height: size.height,
          child: Consumer<CourseProvider>(
            builder: (context, model, child) {
              switch (model.status) {
                case Status.Error:
                  return errorWidget(model);
                case Status.Success:
                  return SuccessWidget(
                    model: model.courseModel,
                  );
                  break;
                case Status.Loading:
                default:
                  return loadingWidget();
                  break;
              }
            },
          ),
        ),
      ),
    );
  }

  Center loadingWidget() {
    return Center(
        child: CircularProgressIndicator(
      backgroundColor: Color(0xff893b9e),
    ));
  }

  Center errorWidget(CourseProvider model) => Center(
          child: Text(
        model.errorMessage,
        style: GoogleFonts.cairo(textStyle: Styles.titleStyle),
      ));
}
