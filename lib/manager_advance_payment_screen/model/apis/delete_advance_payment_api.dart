import 'package:hr_app/utils/config/localip.dart';
import 'package:http/http.dart' as http;

class DeleteAdvancePaymentApi {
  Future<bool> deleteAdvancePaymentApi(int advancePaymentId) async {
    var url =
        "${MyLocalIp().myLocalIpBase}/api/advancePayments/deleteAdvancePayment/$advancePaymentId";

    var response = await http.delete(Uri.parse(url));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
