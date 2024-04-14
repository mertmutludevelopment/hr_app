import 'package:hr_app/utils/config/localip.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class AddNewPendingLeaveApi{

  Future addNewPendingLeaveApi(
    String reason,
    int startLeaveDay,
    int startLeaveMonth,
    int startLeaveYear,
    int endLeaveDay,
    int endLeaveMonth,
    int endLeaveYear,
    int numberOfLeaveDay,
    int userId,
    String fullName,
  ) async {

    var url = "${MyLocalIp().myLocalIpBase}/api/pendingLeaves/createNewPendingLeave";

    var pendingLeaveModel={
      "Reason":reason,
      "StartLeaveDay" :startLeaveDay,
      "StartLeaveMonth" :startLeaveMonth,
      "StartLeaveyear" :startLeaveYear,
      "EndLeaveDay" :endLeaveDay,
      "EndLeaveMonth" :endLeaveMonth,
      "EndLeaveYear" :endLeaveYear,
      "NumberOfLeaveDay" : numberOfLeaveDay,
      "UserId":userId,
      "Fullname" :fullName
    };

    var pendingLeaveModelJson = jsonEncode(pendingLeaveModel);

    var response = await http.post(
      Uri.parse(url),
      body: pendingLeaveModelJson,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

     if (response.statusCode == 201) {
     // print("New pending created");
    } else {
      throw Exception('Veri gönderme basarisiz: ${response.statusCode}');
    }

  }



}