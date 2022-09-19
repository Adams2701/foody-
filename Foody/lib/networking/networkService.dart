
import 'package:flutter/foundation.dart';
import 'package:foody/models/categoriesHomeModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CallApi{
  final String _url = 'http://yummie.glitch.me/';

  Future DishCategory getDishCategories(apiUrl) async {
    try {
      var url = Uri.parse(_url+apiUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final dishCategory= dishCategoryFromJson(response.body);
        if (kDebugMode) {
          print(dishCategory);
        }
        return dishCategory;
      } else {
        if (kDebugMode) {
          print('response.statusCode');
        }
        if (kDebugMode) {
          print('response.body');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }


  // getCategories(apiUrl) async {
  //   http.Response response = await http.get(
  //       Uri.parse(_url+apiUrl)) ;
  //   try {
  //     if (response.statusCode == 200) {
  //       return response;
  //     } else {
  //       return 'failed';
  //     }
  //   } catch (error) {
  //     print(error);
  //     return 'failed';
  //   }
  // }



}

