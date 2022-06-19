import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewer extends StatelessWidget {
  final String photoUrl;
  const PhotoViewer({Key? key, required this.photoUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 300,
        child: PhotoView(
          imageProvider: NetworkImage(photoUrl),
          initialScale: PhotoViewComputedScale.covered * 0.3,
        ));
  }
}
