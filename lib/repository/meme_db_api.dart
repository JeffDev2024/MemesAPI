import 'dart:convert';

import '../models/response_api.dart';
import 'package:http/http.dart' as http;

class memesDBApi{
  
  Future<ResponseApi> getMemesList() async{
    final response = await http.get(Uri.parse('https://api.humorapi.com/memes/search?api-key=10b8f8ac91b3478db72830a678754df2&number=10'));
    print("response ${response.body}");

    if(response.statusCode==200){
      return ResponseApi.fromJson(jsonDecode(response.body));
    }else{
      print("status code ${response.statusCode}");
      throw Exception('Failed to load meme');
    }
    
  }
  
  
}