import 'package:hr_app/utils/config/localip.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddNewNotificationApi {
  Future addNewNotificationApi(
      String notificationDescription,
      int? notificationReceiverId,
      int notificationSenderId,
      String notificationSenderFullname,
      String notificationSenderDepartment) async {
    var url = "${MyLocalIp().myLocalIpBase}/api/notifications/createNewNotification";

    var notificationModel = {
      "NotificationDescription": notificationDescription,
      "NotificationReceiverId": notificationReceiverId,
      "NotificationSenderId": notificationSenderId,
      "NotificationSenderFullname": notificationSenderFullname,
      "NotificationSenderDepartment": notificationSenderDepartment,
    };

    var notificationModelJson = jsonEncode(notificationModel);

    var response = await http.post(
      Uri.parse(url),
      body: notificationModelJson,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 201) {
      //print("New notification created");
    } else {
      throw Exception('Veri gönderme basarisiz: ${response.statusCode}');
    }
  }
}
