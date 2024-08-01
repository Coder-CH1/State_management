import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:state_management/model.dart';

class Networking {
  final Dio _dio = Dio();
  final String endpoint = 'https://jsonplaceholder.org/posts';
  Future<List<Welcome>> fetchPost() async {
   try {
     final response = await _dio.get(endpoint);
         if (response.statusCode == 200) {
           return welcomeFromJson(jsonEncode(response.data));
         } else {
           throw Exception('failed to load');
         }
   } catch (e) {
     throw Exception('failed to load $e');
   }
  }
}