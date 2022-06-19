// ignore: file_names
// ignore: file_names
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:photoproject/model/ModelAlbum.dart';

class fetchData {
  final String myParameter;

  fetchData({required this.myParameter});

  Future<List<Album>> fetchPhotos(http.Client client) async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/' + myParameter));
    // print(response.body);

    // Use the compute function to run parsePhotos in a separate isolate.
    return parsePhotos(response.body); //compute(parsePhotos, response.body);
  }

// A function that converts a response body into a List<Photo>.
  List<Album> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    List<Album> parsedMap =
        parsed.map<Album>((json) => Album.fromJson(json)).toList();
    //print(parsedMap.first);
    return parsedMap;
  }
}
