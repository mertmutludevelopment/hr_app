// To parse this JSON data, do
//
//     final advancePayments = advancePaymentsFromJson(jsonString);

import 'dart:convert';

List<AdvancePayments> advancePaymentsFromJson(String str) => List<AdvancePayments>.from(json.decode(str).map((x) => AdvancePayments.fromJson(x)));

String advancePaymentsToJson(List<AdvancePayments> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdvancePayments {
    int id;
    int advanceAmount;
    int startDay;
    int startMonth;
    int startYear;
    int endDay;
    int endMonth;
    int endYear;
    int userId;
    String fullname;

    AdvancePayments({
        required this.id,
        required this.advanceAmount,
        required this.startDay,
        required this.startMonth,
        required this.startYear,
        required this.endDay,
        required this.endMonth,
        required this.endYear,
        required this.userId,
        required this.fullname,
    });

    factory AdvancePayments.fromJson(Map<String, dynamic> json) => AdvancePayments(
        id: json["id"],
        advanceAmount: json["advanceAmount"],
        startDay: json["startDay"],
        startMonth: json["startMonth"],
        startYear: json["startYear"],
        endDay: json["endDay"],
        endMonth: json["endMonth"],
        endYear: json["endYear"],
        userId: json["userId"],
        fullname: json["fullname"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "advanceAmount": advanceAmount,
        "startDay": startDay,
        "startMonth": startMonth,
        "startYear": startYear,
        "endDay": endDay,
        "endMonth": endMonth,
        "endYear": endYear,
        "userId": userId,
        "fullname": fullname,
    };
}
