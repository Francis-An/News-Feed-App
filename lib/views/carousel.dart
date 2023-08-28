import 'package:carousel_slider/carousel_slider.dart';
import 'package:atunews/models/carousel_category_model.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    //The carousel

    return SafeArea(
      child: Container(
          child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 1.5, //will change to 2.0
          viewportFraction: 0.9, //will remove
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height, //will remove
          // enableInfiniteScroll: false,
          // initialPage: 2,
          autoPlay: true,
        ),
        items: Category.categories
            .map((category) => HeroCarousel(category: category))
            .toList(),
      )),
    );
  }
}

class HeroCarousel extends StatelessWidget {
  const HeroCarousel({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5.0,
      ),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(category.imageUrl,
                  fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    category.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
