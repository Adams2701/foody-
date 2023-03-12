
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model.dart';


class CategoryRepository {
  static const String _baseUrl = 'http://yummie.glitch.me';

  static Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('$_baseUrl/dish-categories'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<Category> categories = [];

      for (var item in jsonData) {
        categories.add(Category.fromJson(item));
      }

      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
