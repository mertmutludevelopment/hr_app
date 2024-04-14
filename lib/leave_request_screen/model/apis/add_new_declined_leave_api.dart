import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../utils/config/localip.dart';

class AddNewDeclinedLeaveApi {
  Future addNewDeclinedLeaveApi(
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
    var url =
        "${MyLocalIp().myLocalIpBase}/api/declinedLeaves/createNewDeclinedLeave";

    var declinedLeaveModel = {
      "Reason": reason,
      "StartLeaveDay": startLeaveDay,
      "StartLeaveMonth": startLeaveMonth,
      "StartLeaveyear": startLeaveYear,
      "EndLeaveDay": endLeaveDay,
      "EndLeaveMonth": endLeaveMonth,
      "EndLeaveYear": endLeaveYear,
      "NumberOfLeaveDay": numberOfLeaveDay,
      "UserId": userId,
      "Fullname": fullName
    };

    var declinedLeaveModelJson = jsonEncode(declinedLeaveModel);

    var response = await http.post(
      Uri.parse(url),
      body: declinedLeaveModelJson,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
