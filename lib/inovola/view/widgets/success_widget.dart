import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inovola/config/Palette.dart';
import 'package:inovola/config/Styles.dart';
import 'package:inovola/inovola/model/core/course_model.dart';
import 'package:inovola/inovola/view/widgets/my_appbar.dart';

class SuccessWidget extends StatelessWidget {
  final CourseModel model;

  const SuccessWidget({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          swiperImage(size),
          Divider(
            color: Palette.infoColor,
          ),
          infoCard(),
          Divider(
            color: Palette.infoColor,
          ),
          trainerInfo(),
          Divider(
            color: Palette.infoColor,
          ),
          courseInfo(),
          Divider(
            color: Palette.infoColor,
          ),
          reservationInfo(),
          Container(
            width: size.width,
            height: 60.0,
            child: FlatButton(
              onPressed: () {},
              child: Text(
                'قم بالحجز الآن',
                style: GoogleFonts.cairo(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
              color: Color(0xff893b9e),
            ),
          )
        ],
      ),
    );
  }

  Widget courseInfo() {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            'عن الدورة',
            style: GoogleFonts.cairo(textStyle: Styles.subtitleStyle),
            textDirection: TextDirection.rtl,
          ),
          Text(
            model.occasionDetail,
            style: GoogleFonts.cairo(textStyle: Styles.infoStyle),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }

  Widget trainerInfo() {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 20.0),
                child: Text(
                  model.trainerName,
                  style: GoogleFonts.cairo(textStyle: Styles.subtitleStyle),
                  textDirection: TextDirection.rtl,
                ),
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(model.trainerImg),
              ),
            ],
          ),
          Text(
            model.trainerInfo,
            style: GoogleFonts.cairo(textStyle: Styles.infoStyle),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }

  Widget infoCard() {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            '#${model.interest}',
            style: GoogleFonts.cairo(textStyle: Styles.infoStyle),
            textDirection: TextDirection.rtl,
          ),
          Text(
            model.title,
            style: GoogleFonts.cairo(textStyle: Styles.titleStyle),
            textDirection: TextDirection.rtl,
          ),
          ListTile(
            title: Text(
              model.date.toString(),
              style: GoogleFonts.cairo(textStyle: Styles.infoStyle),
              textDirection: TextDirection.rtl,
            ),
            trailing: Image.asset(
              'assets/img/DateIcon.png',
              color: Palette.infoColor,
              height: 20.0,
              width: 20.0,
            ),
          ),
          ListTile(
            title: Text(
              model.address,
              style: GoogleFonts.cairo(textStyle: Styles.infoStyle),
              textDirection: TextDirection.rtl,
            ),
            trailing: Image.asset(
              'assets/img/AddressIcon.png',
              color: Palette.infoColor,
              height: 20.0,
              width: 20.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget swiperImage(Size size) {
    return Stack(
      children: <Widget>[
        Container(
          width: size.width,
          height: (size.width > 500)? size.height * 0.65: size.height * 0.35,
          child: Swiper(
            itemCount: model.img.length,
            itemBuilder: (context, index) {
              return Image.network(
                model.img[index],
                fit: BoxFit.fill,
              );
            },
            pagination: SwiperPagination(
              builder: SwiperPagination.dots,
              alignment: Alignment.bottomLeft,
            ),
            controller: SwiperController(),
          ),
        ),
        MyAppBar(),
      ],
    );
  }

  Widget reservationInfo() {
    int h = (model.reservTypes.length % 6 == 0)
        ? 6
        : (model.reservTypes.length % 6);
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            'تكلفة الدورة',
            style: GoogleFonts.cairo(textStyle: Styles.subtitleStyle),
            textDirection: TextDirection.rtl,
          ),
          Container(
            height: 50.0 * h,
            child: ListView.builder(
              itemBuilder: (context, i) {
                return Container(
                  height: 50,
                  child: ListTile(
                    title: Text(
                      model.reservTypes[i].name,
                      style: GoogleFonts.cairo(textStyle: Styles.infoStyle),
                      textDirection: TextDirection.rtl,
                    ),
                    leading: Text(
                      model.reservTypes[i].price.toString(),
                      style: GoogleFonts.cairo(textStyle: Styles.infoStyle),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                );
              },
              itemCount: model.reservTypes.length,
            ),
          ),
        ],
      ),
    );
  }
}
