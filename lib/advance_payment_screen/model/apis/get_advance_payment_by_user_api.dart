import 'package:http/http.dart' as http;

import 'dart:convert';

import '../../../utils/config/localip.dart';

class GetAdvancePaymentByUserApi {
  Future getAdvancePaymentByUserApi(int userId) async {
    var url =
        "${MyLocalIp().myLocalIpBase}/api/advancePayments/getAdvancePaymentByUser/$userId";

    var response = await http.get(Uri.parse(url));

   if (response.statusCode == 200) {
      var jsonData = json.decode(response.body).toList();

      return jsonData;
    } else {
      throw Exception('Veri çekme başarısız: ${response.statusCode}');
    }
  }
}
