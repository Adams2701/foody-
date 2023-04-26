

import 'package:foody/data_layer/apiModels/dishModel.dart';
import 'package:foody/data_layer/apiModels/dishes_response_model.dart';
import 'package:foody/data_layer/apiModels/oder_model.dart';
import 'package:foody/presentation/route_manger/api_route.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class DishApi {
  Future<DishCategoriesResponse> fetchDishData() async {
    final allCategorieesResponse = await http.get(Uri.parse('${Route.baseUrl}${Route.fetchAllCategories}'));
    if (allCategorieesResponse.statusCode == 200) {
      return DishCategoriesResponse.fromJson(jsonDecode(allCategorieesResponse.body));
    } else {
      throw Exception('Failed to fetch dish data');
    }
  }

  Future<List<Data2>> fetchDishesByCategory(String categoryId) async {
    final url = Uri.parse("${Route.baseUrl}${Route.fetchCategoryDishes(categoryId)}");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final dishesResponse = DishesResponses.fromJson(jsonResponse);
      final dishes = dishesResponse.data;
      return dishes!;
    } else {
      throw Exception('Failed to fetch dishes by category');
    }
  }

  Future<OrderDish> placeOrder({required String orderName, required String dishId}) async {
    final oderUrl = Uri.parse('${Route.baseUrl}${Route.placeOrder(dishId)}');
    final orderResponse = await http.post(
      oderUrl,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': orderName}),
    );
    if (orderResponse.statusCode == 200) {
      final jsonResponse = jsonDecode(orderResponse.body);
      print('POST request successful');
      print(orderResponse.body);
      return OrderDish.fromJson(jsonResponse);
    } else {
      print('Error: ${orderResponse.statusCode}');
      throw Exception('Failed to make POST request');
    }
  }

}
