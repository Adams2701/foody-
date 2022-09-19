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