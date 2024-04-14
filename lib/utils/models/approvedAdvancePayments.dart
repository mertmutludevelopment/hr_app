// To parse this JSON data, do
//
//     final approvedAdvancePayments = approvedAdvancePaymentsFromJson(jsonString);

import 'dart:convert';

List<ApprovedAdvancePayments> approvedAdvancePaymentsFromJson(String str) => List<ApprovedAdvancePayments>.from(json.decode(str).map((x) => ApprovedAdvancePayments.fromJson(x)));

String approvedAdvancePaymentsToJson(List<ApprovedAdvancePayments> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApprovedAdvancePayments {
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

    ApprovedAdvancePayments({
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

    factory ApprovedAdvancePayments.fromJson(Map<String, dynamic> json) => ApprovedAdvancePayments(
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
