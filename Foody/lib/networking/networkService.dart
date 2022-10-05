
import 'package:foody/data_layer/apiModels/dishModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CallApi {
  final String _url = 'http://yummie.glitch.me/';

  Future<List<Categories>> getDish(apiUrl) async {

      var url = Uri.parse(_url + apiUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final List catData = jsonDecode(response.body);
        return catData.map((e) => Categories.fromJson(e)).toList();
      } else {
        throw Exception(response.reasonPhrase);
          // 'errorMessage': 'something wrong happened',
      }
    }
  }

