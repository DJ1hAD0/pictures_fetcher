import 'package:flutter/material.dart';
import 'package:photoproject/controller/FetchData.dart';
import 'package:photoproject/model/ModelAlbum.dart';
import 'package:photoproject/view/ThumbnailsList.dart';
import 'package:http/http.dart' as http;

class PhotoWidget extends StatelessWidget {
  final String myParameter;

  const PhotoWidget({Key? key, required this.myParameter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: FutureBuilder<List<Album>>(
        future: fetchData(myParameter: myParameter).fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
