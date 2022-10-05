
import 'dart:convert';
import 'package:dbstech_bloc_example/user_model.dart';
import 'package:http/http.dart';
// import 'package:http/http.dart' as http;

class UserRepository {
  String endpoint = 'https://reqres.in/api/users?page=2';
  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200){
      final List result = jsonDecode(response.body)['data'];

      return result.map(((e) => UserModel.fromJson(e))).toList();
    }else {
      throw Exception(response.reasonPhrase);
    }
  }
}



// class UserRepository {
//   String endpoint = 'https://reqres.in/api/users?page=2';
//   Future<List<UserModel>> getUsers() async {
//     var url = Uri.http(endpoint);
//     var response = await http.get(url);
//     if (response.statusCode == 200){
//       final List result = jsonDecode(response.body)['data'];
//
//       return result.map(((e) => UserModel.fromJson(e))).toList();
//     }else {
//       throw Exception(response.reasonPhrase);
//     }
//   }
// }
