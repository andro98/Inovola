import 'package:meta/meta.dart';

class CourseModel {
  CourseModel({
    @required this.id,
    @required this.title,
    @required this.img,
    @required this.interest,
    @required this.price,
    @required this.date,
    @required this.address,
    @required this.trainerName,
    @required this.trainerImg,
    @required this.trainerInfo,
    @required this.occasionDetail,
    @required this.latitude,
    @required this.longitude,
    @required this.isLiked,
    @required this.isSold,
    @required this.isPrivateEvent,
    @required this.hiddenCashPayment,
    @required this.specialForm,
    @required this.questionnaire,
    @required this.questExplanation,
    @required this.reservTypes,
  });

  final int id;
  final String title;
  final List<String> img;
  final String interest;
  final int price;
  final DateTime date;
  final String address;
  final String trainerName;
  final String trainerImg;
  final String trainerInfo;
  final String occasionDetail;
  final String latitude;
  final String longitude;
  final bool isLiked;
  final bool isSold;
  final bool isPrivateEvent;
  final bool hiddenCashPayment;
  final int specialForm;
  final dynamic questionnaire;
  final dynamic questExplanation;
  final List<ReservType> reservTypes;

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    img: json["img"] == null ? null : List<String>.from(json["img"].map((x) => x)),
    interest: json["interest"] == null ? null : json["interest"],
    price: json["price"] == null ? null : json["price"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    address: json["address"] == null ? null : json["address"],
    trainerName: json["trainerName"] == null ? null : json["trainerName"],
    trainerImg: json["trainerImg"] == null ? null : json["trainerImg"],
    trainerInfo: json["trainerInfo"] == null ? null : json["trainerInfo"],
    occasionDetail: json["occasionDetail"] == null ? null : json["occasionDetail"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    isLiked: json["isLiked"] == null ? null : json["isLiked"],
    isSold: json["isSold"] == null ? null : json["isSold"],
    isPrivateEvent: json["isPrivateEvent"] == null ? null : json["isPrivateEvent"],
    hiddenCashPayment: json["hiddenCashPayment"] == null ? null : json["hiddenCashPayment"],
    specialForm: json["specialForm"] == null ? null : json["specialForm"],
    questionnaire: json["questionnaire"],
    questExplanation: json["questExplanation"],
    reservTypes: json["reservTypes"] == null ? null : List<ReservType>.from(json["reservTypes"].map((x) => ReservType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "img": img == null ? null : List<dynamic>.from(img.map((x) => x)),
    "interest": interest == null ? null : interest,
    "price": price == null ? null : price,
    "date": date == null ? null : date.toIso8601String(),
    "address": address == null ? null : address,
    "trainerName": trainerName == null ? null : trainerName,
    "trainerImg": trainerImg == null ? null : trainerImg,
    "trainerInfo": trainerInfo == null ? null : trainerInfo,
    "occasionDetail": occasionDetail == null ? null : occasionDetail,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "isLiked": isLiked == null ? null : isLiked,
    "isSold": isSold == null ? null : isSold,
    "isPrivateEvent": isPrivateEvent == null ? null : isPrivateEvent,
    "hiddenCashPayment": hiddenCashPayment == null ? null : hiddenCashPayment,
    "specialForm": specialForm == null ? null : specialForm,
    "questionnaire": questionnaire,
    "questExplanation": questExplanation,
    "reservTypes": reservTypes == null ? null : List<dynamic>.from(reservTypes.map((x) => x.toJson())),
  };
}

class ReservType {
  ReservType({
    @required this.id,
    @required this.name,
    @required this.count,
    @required this.price,
  });

  final int id;
  final String name;
  final int count;
  final int price;

  factory ReservType.fromJson(Map<String, dynamic> json) => ReservType(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    count: json["count"] == null ? null : json["count"],
    price: json["price"] == null ? null : json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "count": count == null ? null : count,
    "price": price == null ? null : price,
  };
}
