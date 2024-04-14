// To parse this JSON data, do
//
//     final declinedLeaves = declinedLeavesFromJson(jsonString);

import 'dart:convert';

List<DeclinedLeaves> declinedLeavesFromJson(String str) => List<DeclinedLeaves>.from(json.decode(str).map((x) => DeclinedLeaves.fromJson(x)));

String declinedLeavesToJson(List<DeclinedLeaves> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeclinedLeaves {
    int id;
    String reason;
    int startLeaveDay;
    int startLeaveMonth;
    int startLeaveYear;
    int endLeaveDay;
    int endLeaveMonth;
    int endLeaveYear;
    int numberOfLeaveDay;
    int userId;
    String fullname;

    DeclinedLeaves({
        required this.id,
        required this.reason,
        required this.startLeaveDay,
        required this.startLeaveMonth,
        required this.startLeaveYear,
        required this.endLeaveDay,
        required this.endLeaveMonth,
        required this.endLeaveYear,
        required this.numberOfLeaveDay,
        required this.userId,
        required this.fullname,
    });

    factory DeclinedLeaves.fromJson(Map<String, dynamic> json) => DeclinedLeaves(
        id: json["id"],
        reason: json["reason"],
        startLeaveDay: json["startLeaveDay"],
        startLeaveMonth: json["startLeaveMonth"],
        startLeaveYear: json["startLeaveYear"],
        endLeaveDay: json["endLeaveDay"],
        endLeaveMonth: json["endLeaveMonth"],
        endLeaveYear: json["endLeaveYear"],
        numberOfLeaveDay: json["numberOfLeaveDay"],
        userId: json["userId"],
        fullname: json["fullname"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "reason": reason,
        "startLeaveDay": startLeaveDay,
        "startLeaveMonth": startLeaveMonth,
        "startLeaveYear": startLeaveYear,
        "endLeaveDay": endLeaveDay,
        "endLeaveMonth": endLeaveMonth,
        "endLeaveYear": endLeaveYear,
        "numberOfLeaveDay": numberOfLeaveDay,
        "userId": userId,
        "fullname": fullname,
    };
}
