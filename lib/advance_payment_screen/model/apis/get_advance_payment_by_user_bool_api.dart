import 'package:http/http.dart' as http;

import '../../../utils/config/localip.dart';

class GetAdvancePaymentByUserBoolApi {
  Future getAdvancePaymentByUserBoolApi(int userId) async {
    var url =
        "${MyLocalIp().myLocalIpBase}/api/advancePayments/getAdvancePaymentByUserBool/$userId";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
