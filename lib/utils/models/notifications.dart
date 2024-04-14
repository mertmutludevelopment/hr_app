// To parse this JSON data, do
//
//     final notifications = notificationsFromJson(jsonString);

import 'dart:convert';

List<Notifications> notificationsFromJson(String str) => List<Notifications>.from(json.decode(str).map((x) => Notifications.fromJson(x)));

String notificationsToJson(List<Notifications> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notifications {
    int id;
    String notificationDescription;
    int? notificationReceiverId;
    int notificationSenderId;
    String notificationSenderFullname;
    String notificationSenderDepartment;

    Notifications({
        required this.id,
        required this.notificationDescription,
        required this.notificationReceiverId,
        required this.notificationSenderId,
        required this.notificationSenderFullname,
        required this.notificationSenderDepartment,
    });

    factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        id: json["id"],
        notificationDescription: json["notificationDescription"],
        notificationReceiverId: json["notificationReceiverId"],
        notificationSenderId: json["notificationSenderId"],
        notificationSenderFullname: json["notificationSenderFullname"],
        notificationSenderDepartment: json["notificationSenderDepartment"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "notificationDescription": notificationDescription,
        "notificationReceiverId": notificationReceiverId,
        "notificationSenderId": notificationSenderId,
        "notificationSenderFullname": notificationSenderFullname,
        "notificationSenderDepartment": notificationSenderDepartment,
    };
}
