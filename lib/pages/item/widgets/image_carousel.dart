import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ItemImageCarousel extends StatelessWidget {
  const ItemImageCarousel({super.key, this.imageURLs});

  final List<String>? imageURLs;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imageURLs?.map(
        (e) => Image.network(
          e,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ).toList(),
      options: CarouselOptions(
        aspectRatio: 3/4,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        pauseAutoPlayOnTouch: true,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
