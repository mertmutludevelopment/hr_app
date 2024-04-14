import 'package:hr_app/utils/config/localip.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class GetAllDeclinedLeaveApi {
  Future<List> getAllDeclinedLeaveApi() async {
    var url =
        "${MyLocalIp().myLocalIpBase}/api/declinedLeaves/getAllDeclinedLeaves";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body).toList();

      return jsonData;
    } else {
      throw Exception('Veri çekme başarısız: ${response.statusCode}');
    }
  }
}
