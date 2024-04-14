import 'package:hr_app/utils/models/users.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import '../../../utils/config/localip.dart';


class SearchUserApi {
  Future<List<Users>>  searchUserApi(String userName) async{

    var url ="${MyLocalIp().myLocalIpBase}/api/users/getSearchedUsers";

     var userModel = {
      "Email": "",
      "Fullname": userName,
      "Department": "",
      "PhoneNumber": "",
      "BirthDay": 1,
      "BirthMonth": 1,
      "BirthYear": 2001,
      "Password": "",
      "LeaveDay": 0
    };
    var userModelJson = jsonEncode(userModel);

    var response = await http.post(
      Uri.parse(url),
      body:userModelJson ,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

     if(response.statusCode == 200){
      var jsonData = json.decode(response.body) as List;
      List<Users> usersList = jsonData.map((item) => Users.fromJson(item)).toList();
      return usersList;
    }else {
      throw Exception('Veri çekme başarısız: ${response.statusCode}');

    }

  }

}