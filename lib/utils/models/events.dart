// To parse this JSON data, do
//
//     final events = eventsFromJson(jsonString);

import 'dart:convert';

List<Events> eventsFromJson(String str) => List<Events>.from(json.decode(str).map((x) => Events.fromJson(x)));

String eventsToJson(List<Events> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Events {
    int id;
    String eventName;
    String eventLocation;
    String eventDay;
    String eventTime;
    String eventDescription;

    Events({
        required this.id,
        required this.eventName,
        required this.eventLocation,
        required this.eventDay,
        required this.eventTime,
        required this.eventDescription,
    });

    factory Events.fromJson(Map<String, dynamic> json) => Events(
        id: json["id"],
        eventName: json["eventName"],
        eventLocation: json["eventLocation"],
        eventDay: json["eventDay"],
        eventTime: json["eventTime"],
        eventDescription: json["eventDescription"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "eventName": eventName,
        "eventLocation": eventLocation,
        "eventDay": eventDay,
        "eventTime": eventTime,
        "eventDescription": eventDescription,
    };
}
