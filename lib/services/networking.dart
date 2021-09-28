import 'package:clima/screens/loading_screen.dart';
import 'dart:convert';
import 'package:http/http.dart';

class NetworkHelper{
  NetworkHelper(this.url);
  final String url;
  Future getData() async{
    Response res = await get(Uri.parse(url));
    if(res.statusCode == 200){
      return jsonDecode(res.body);
    }
    else{
      print(res.statusCode);
    }
  }
}