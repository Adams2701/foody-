import 'dart:convert';
import 'package:api_test/categoryModel.dart';
import 'package:http/http.dart';

class Strings {
  static String foodURL =
      'https://yummie.glitch.me/dish-categories';
}

class ApiManager {
  Future<DishCategory> getData() async {
    var client = http.Client();
    var dishCategoryModel;

    try {
      var response = await client.get(Strings.foodURL);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        dishCategoryModel = DishCategory.fromJson(jsonMap);
      }
    } catch (exception) {
      return dishCategoryModel;
    }

    return dishCategoryModel;
  }
}