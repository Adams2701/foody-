import 'package:http/http.dart' as http;
// import 'dart:convert';

class CallApi{
  final String _url = 'http://yummie.glitch.me/';

  getCategories(apiUrl) async {
    http.Response response = await http.get(
        Uri.parse(_url+apiUrl)) ;
    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        return 'failed';
      }
    } catch (error) {
      print(error);
      return 'failed';
    }
  }
}

//
// class CallApi {
//   CallApi(this._url);
//
//   final String _url;
//
//   Future getData(apiUrl) async {
//     http.Response response = await http.get(Uri.parse(_url+apiUrl)) ;
//
//     if (response.statusCode == 200) {
//       String data = response.body;
//
//       return jsonDecode(data);
//     } else {
//       print(response.statusCode);
//     }
//   }
// }