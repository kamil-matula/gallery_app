import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/models/photo.dart';

class PhotosDetailsPage extends StatelessWidget {
  final Photo photo;

  const PhotosDetailsPage({
    required this.photo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo ${photo.id}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: screenWidth,
              height: screenWidth,
              child: CachedNetworkImage(
                imageUrl: photo.url,
                placeholder: (_, __) => const Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (_, __, ___) => const Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.error),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              photo.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
