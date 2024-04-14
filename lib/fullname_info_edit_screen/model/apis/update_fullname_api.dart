import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../utils/config/localip.dart';

class UpdateFullnameApi {
  Future updateFullname(
    int id,
    String fullname,
  ) async {
    var url = "${MyLocalIp().myLocalIpBase}/api/users/updateUserFullname/$id";

    var userModel = {
      "Email": "",
      "Fullname": fullname,
      "Department": "",
      "PhoneNumber": "",
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
