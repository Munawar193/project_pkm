import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rice_quality_scanning/model/proses_model.dart';

class ImageProsesApi {
  Future getImageProses(String? getUrl) async {
    try {
      var endpoint = Uri.parse('$getUrl/proses');
      var respone = await http.get(endpoint);
      var body = jsonDecode(respone.body);
      print(respone.body);
      return ProsesModel.fromJson(body);
    } catch (e) {
      e.toString();
    }
  }
}
