
import 'package:foody/data_layer/apiModels/dishModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class DishApi {
  final String _url = 'http://yummie.glitch.me/dish-categories';
  Future<DishCategoriesResponse> fetchDishCategories() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      return DishCategoriesResponse.fromJson(jsonDecode(response.body)['data']);
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to fetch dish categories');
    }
  }
}


















// class DishApi {
//   static const String _url = 'http://yummie.glitch.me/dish-categories';
//
//   Future<List<T>> getDishes<T>(String path) async {
//     var url = Uri.parse('$_url/$path');
//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       final List data = jsonDecode(response.body)['data'];
//       return data.map((e) => _fromJson<T>(e)).toList();
//     } else {
//       throw Exception(response.reasonPhrase);
//     }
//   }
//
//   T _fromJson<T>(Map<String, dynamic> json) {
//     if (T == Categories) {
//       return Categories.fromJson(json) as T;
//     } else if (T == Populars) {
//       return Populars.fromJson(json) as T;
//     } else if (T == Specials) {
//       return Specials.fromJson(json) as T;
//     } else {
//       throw ArgumentError('Invalid type: $T');
//     }
//   }
// }


//To use this class, you would simply create an instance of DishApi and call
//the getDishes method with the appropriate path and type parameter. For example:

// var api = DishApi();
// var categories = await api.getDishes<Categories>('categories');
// var populars = await api.getDishes<Populars>('popular');
// var specials = await api.getDishes<Specials>('special');
//

