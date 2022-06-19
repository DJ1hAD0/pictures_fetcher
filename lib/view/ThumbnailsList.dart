// ignore: file_names
import 'package:flutter/material.dart';
import 'package:photoproject/model/ModelAlbum.dart';
import 'package:photoproject/view/PhotoViewer.dart';

class PhotosList extends StatelessWidget {
  const PhotosList({Key? key, required this.photos}) : super(key: key);

  final List<Album> photos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Column(children: [
        //Image.network(photos[index].thumbnailUrl),
        GestureDetector(
        child: Hero(
        tag: 'imageHero',
          child: Image.network(photos[index].thumbnailUrl),
        ),
        onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PhotoViewer(photoUrl: photos[index].url)));
        }),
        Text(photos[index].title),
        ]
        );
      }
    );
  }
}
