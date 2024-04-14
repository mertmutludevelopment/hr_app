
import 'package:hr_app/utils/config/localip.dart';
import 'package:http/http.dart' as http;

class EventDeleteApi{

  Future<bool> eventDeleteApi(int eventId) async{

    var url = "${MyLocalIp().myLocalIpBase}/api/events/deleteEvent/$eventId";

    var response = await http.delete(Uri.parse(url));

    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }


     
  }

}