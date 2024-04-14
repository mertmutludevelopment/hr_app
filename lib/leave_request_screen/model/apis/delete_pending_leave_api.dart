import 'package:hr_app/utils/config/localip.dart';
import 'package:http/http.dart' as http;

class DeletePendingLeaveApi {
  Future<bool> deletePendingLeaveApi(int pendingLeaveId) async {
    var url =
        "${MyLocalIp().myLocalIpBase}/api/pendingLeaves/deletePendingLeave/$pendingLeaveId";

    var response = await http.delete(Uri.parse(url));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
