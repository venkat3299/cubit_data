


import 'package:dio/dio.dart';
import 'package:proj_1/models/model.dart';

class BeerRepository {
  final Dio _dio = Dio();

  Future<List<Beer>> getAles() async {
    try {
      final response = await _dio.get('https://api.sampleapis.com/beers/ale');
      final data = response.data as List<dynamic>;
      final beers = data.map((json) => Beer.fromJson(json)).toList();
      return beers;
    } catch (error) {
      throw Exception('Failed to load beers: $error');
    }
  }
}