import 'package:hr_app/utils/config/localip.dart';
import 'package:http/http.dart' as http;

class DeleteNotificationApi {
  Future<bool> deleteNotificationApi(int notificationId) async {
    var url =
        "${MyLocalIp().myLocalIpBase}/api/notifications/deleteNotification/$notificationId";

    var response = await http.delete(Uri.parse(url));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
