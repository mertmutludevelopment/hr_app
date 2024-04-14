// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
    int id;
    String email;
    String fullname;
    String department;
    String phoneNumber;
    int birthDay;
    int birthMonth;
    int birthYear;
    String password;
    int leaveDay;

    Users({
        required this.id,
        required this.email,
        required this.fullname,
        required this.department,
        required this.phoneNumber,
        required this.birthDay,
        required this.birthMonth,
        required this.birthYear,
        required this.password,
        required this.leaveDay,

    });

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        email: json["email"],
        fullname: json["fullname"],
        department: json["department"],
        phoneNumber: json["phoneNumber"],
        birthDay: json["birthDay"],
        birthMonth: json["birthMonth"],
        birthYear: json["birthYear"],
        password: json["password"],
        leaveDay: json["leaveDay"],

    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "fullname": fullname,
        "department": department,
        "phoneNumber": phoneNumber,
        "birthDay": birthDay,
        "birthMonth": birthMonth,
        "birthYear": birthYear,
        "password": password,
        "leaveDay": leaveDay,

    };
}
