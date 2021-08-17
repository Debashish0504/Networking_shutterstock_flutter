
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:networking_demo/models/assets.dart';
import 'package:networking_demo/models/data.dart';
import 'package:networking_demo/models/preview.dart';
import 'package:networking_demo/utils/constants.dart';

class Resource<T> {
  final String url; 
  T Function(Response response) parse;

  Resource({this.url,this.parse});
}

class Webservice {

  Future<List<String>> load(String img_val) async {
    Map<String,dynamic> themesList;
    List<Data> themes = [];
    List<String> val=[];

    for (int i=1;i<=Constants.page;i++){

      var queryparams = {
        'page': i.toString(),
        'per_page': Constants.per_page.toString(),
      };
      var uri = Uri(
        scheme: 'https',
        host: 'api.shutterstock.com',
        path: '/v2/images/search',
        queryParameters: queryparams,
      );
     // String url = Constants.HEADLINE_Images_URL+"?page=$i&per_page=${Constants.per_page}";

      await http
          .get(uri,
        headers: {
          'Authorization': 'Bearer v2/S2lUR0FYcVZqZjJxV1BUN3oyR3BrbldUbDJUQWhkNzgvMzA3NzM0NDYyL2N1c3RvbWVyLzQvclQ4Y0RJd05DY3p2SjZVSUk2MUpfWGlxdDZOSTZsYVVHeThrTTM5akJFMEE2Ul9WNEkzNTBfTTk1QzNRWWFQZ1B1ZUVoa2RsSndscjZIdFgzby1JUW9aOGZ4djVYdk1qbVJwV0gzU1doVWxDeTlQVVpjb0E0alViWElKU1QwV21EUVFtTlBxZEhjQVpVczU4QTF6eXBhMlhWbVlOZnJWdV9JUlNlZU5POGU4NHNOMkVnRUg4T2VqOU42Ums5NUJweEhzcnB4R0V1ZWp6MmhJeUVGdFhZUS9kVGFTQ0xOZUI2NS1sMFRuRkszN05B'
        })
          .then((response) {
        print(response.statusCode);
        themesList = jsonDecode(response.body);
      });
      try {
        themesList.forEach((k,v) {
          //print('$k: ${v}');
          if(k=='data'){
            print('$k: ${v}');
            for (var themeMap in v) {
              themes.add(Data.fromJson(themeMap));
            }
            print(themes[0].assets.preview.url);
            //themes.add(value);
          }
        });
      } catch (e) {
        print(e);
      }
    }


      for(int i=0;i<themes.length;i++){
        switch(img_val){
          case 'preview':
            val.add(themes[i].assets.preview.url);
            break;
          case 'small_thumb':
            val.add(themes[i].assets.small_thumb.url);
            break;
          case 'large_thumb':
            val.add(themes[i].assets.large_thumb.url);
            break;
          case 'huge_thumb':
            val.add(themes[i].assets.huge_thumb.url);
            break;
          case 'preview_1000':
            val.add(themes[i].assets.preview_1000.url);
            break;
          case 'preview_1500':
            val.add(themes[i].assets.preview_1500.url);
            break;
        }
      }
      print(val.length);
      return val;
  }

}