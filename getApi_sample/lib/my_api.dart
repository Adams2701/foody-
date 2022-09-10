import 'package:http/http.dart' as http;
class CallApi{
  final String _url = 'http://yummie.glitch.me/';
  final String _imgUrl='http://yummie.glitch.me/uploads/';
  getImage(){
    return _imgUrl;
  }
  getArticleData(apiUrl) async {
    http.Response response = await http.get(
        Uri.parse(_url+apiUrl)) ;
    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        return 'failed';
      }
    } catch (e) {
      print(e);
      return 'failed';
    }
  }
}