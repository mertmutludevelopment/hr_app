import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetTasksApi {
  Future<Map<String, dynamic>> getTasksApi() async {
    var url =
        'https://api.notion.com/v1/databases/${dotenv.env['NOTION_DATABASE_ID']}/query';

    var response = await http.post(
      Uri.parse(url),
      headers: {
        HttpHeaders.authorizationHeader:
            'Bearer ${dotenv.env['NOTION_API_KEY']}',
        'Notion-Version': '2022-06-28',
      },
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      return jsonData;
    }
    throw Exception('Veri çekme başarısız: ${response.statusCode}');
  }
}
