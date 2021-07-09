import 'package:http/http.dart' as http ;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({this.url});

  final String url;

  Future networkData() async {
    http.Response response =
    await http.get(url);
    if (response.statusCode == 200) {
      String decodedData = response.body;
      return jsonDecode(decodedData);
    }
    else {
      print(response.statusCode);
    }
  }
}