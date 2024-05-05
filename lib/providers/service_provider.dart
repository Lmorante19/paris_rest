import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ServiceProvider extends ChangeNotifier {
  String ApiUser = 'test';
  String ApiPass = 'test2023';
  String BaseUrl = 'domain';

  ServiceProvider() {
    getListProducts();
  }

  getListProducts() async {
    var url = Uri.http(BaseUrl, 'path');
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$ApiUser:$ApiPass'))}';
    final response = await http.get(url, headers: {'authorization': basicAuth});
    print(response.body);
  }
}
