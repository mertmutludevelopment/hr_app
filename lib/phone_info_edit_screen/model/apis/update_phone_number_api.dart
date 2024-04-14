import 'dart:convert';
import 'package:hr_app/utils/config/localip.dart';
import 'package:http/http.dart' as http;

class UpdatePhoneNumberApi {
  Future updatePhoneNumber(
    int id,
    String phoneNumber,
  ) async {
    var url = "${MyLocalIp().myLocalIpBase}/api/users/updateUserPhoneNumber/$id";

    var userModel = {
      "Email": "",
      "Fullname": "",
      "Department": "",
      "PhoneNumber": phoneNumber,
      "BirthDay": 1,
      "BirthMonth": 1,
      "BirthYear": 2001,
      "Password": "",
      "LeaveDay":0
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
