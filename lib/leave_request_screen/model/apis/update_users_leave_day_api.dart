import 'dart:convert';
import 'package:hr_app/utils/config/localip.dart';
import 'package:http/http.dart' as http;

class UpdateUsersLeaveDayApi {
  Future updateLeaveDayApi(int id, int leaveDay) async {
    var url = "${MyLocalIp().myLocalIpBase}/api/users/updateUserLeaveDay/$id";

    var userModel = {
      "Email": "",
      "Fullname": "",
      "Department": "",
      "PhoneNumber": "",
      "BirthDay": 1,
      "BirthMonth": 1,
      "BirthYear": 2001,
      "Password": "",
      "LeaveDay": leaveDay
    };

    var userModelJson = jsonEncode(userModel);

    var response = await http.put(
      Uri.parse(url),
      body: userModelJson,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Exception('Veri güncelleme başarısız: ${response.statusCode}');
    }
  }
}
