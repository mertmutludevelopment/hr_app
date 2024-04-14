import 'package:hr_app/utils/config/localip.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class GetAllPendingLeavesApi {
  Future<List> getAllPendingLeavesApi() async {
    var url =
        "${MyLocalIp().myLocalIpBase}/api/pendingLeaves/getAllPendingLeaves";

    var response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body).toList();

      return jsonData;
    } else {
      throw Exception('Veri çekme başarısız: ${response.statusCode}');
    }
  }
}
