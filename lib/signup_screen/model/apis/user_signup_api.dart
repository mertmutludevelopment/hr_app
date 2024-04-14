
import 'package:hr_app/utils/config/localip.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserSignupApi {
  Future userSignup  (
      String email,
      String fullname,
      String department,
      String phoneNumber,
      int birthDay,
      int birthMonth,
      int birthYear,
      String password,
      ) async {

      var url ="${MyLocalIp().myLocalIpBase}/api/users/createNewUser";
      
      var userModel = {
      "Email": email,
      "Fullname": fullname,
      "Department": department,
      "PhoneNumber": phoneNumber,
      "BirthDay": birthDay,
      "BirthMonth": birthMonth,
      "BirthYear": birthYear,
      "Password": password,
      "LeaveDay": 30
    };

    var userModelJson = jsonEncode(userModel);

    //print("RESPONSE ÖNCESİ");

    var response = await http.post(
      Uri.parse(url),
      body: userModelJson,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    //print("RESPONSE :  ${response.body} ");

    if(response.statusCode == 201){
     // print("New user created");
    }else {
      throw Exception('Veri çekme başarısız: ${response.statusCode}');

    }



    }
}
