import 'package:hr_app/utils/config/localip.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class GetPendingLeavesByUserApi {
  Future<List> getPendingLeavesByUserApi (int userId) async {
    var url =
        "${MyLocalIp().myLocalIpBase}/api/pendingLeaves/getPendingLeavesByUser/$userId";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body).toList();

      return jsonData;
    } else {
      throw Exception('Veri çekme başarısız: ${response.statusCode}');
    }
  }
}
