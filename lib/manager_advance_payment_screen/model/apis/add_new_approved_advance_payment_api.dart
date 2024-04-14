import 'package:hr_app/utils/config/localip.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddNewApprovedAdvancePaymentApi {
  Future addNewApprovedAdvancePaymentApi(
    int advanceAmount,
    int startDay,
    int startMonth,
    int startYear,
    int endDay,
    int endMonth,
    int endYear,
    int userId,
    String fullName,
  ) async {
    var url =
        "${MyLocalIp().myLocalIpBase}/api/approvedAdvancePayment/createNewApprovedAdvancePayment";

    var approvedAdvancePaymentModel = {
      "AdvanceAmount": advanceAmount,
      "StartDay": startDay,
      "StartMonth": startMonth,
      "StartYear": startYear,
      "EndDay": endDay,
      "EndMonth": endMonth,
      "EndYear": endYear,
      "UserId": userId,
      "Fullname": fullName
    };

    var approvedAdvancePaymentModelJson = jsonEncode(approvedAdvancePaymentModel);

    var response = await http.post(
      Uri.parse(url),
      body: approvedAdvancePaymentModelJson,
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
