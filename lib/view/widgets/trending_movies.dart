// ignore_for_file: camel_case_types

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/view/trending_details.dart';

class BuildTrendingMovies extends StatelessWidget {
  const BuildTrendingMovies({super.key});
  // final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
          itemCount: 10,
          options: CarouselOptions(
              height: 300,
              autoPlay: true,
              viewportFraction: 0.55,
              enlargeCenterPage: true,
              pageSnapping: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(seconds: 1)),
          itemBuilder: (context, itemIndex, pageViewIndex) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TrendingDetails()));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 300,
                  width: 200,
                  color: Colors.green,

                  // child: Image.network(
                  //   filterQuality: FilterQuality.high,
                  //   fit: BoxFit.cover,
                  //   '${Constant.imagePath}${snapshot.data[itemIndex].posterPath}',
                  // ),
                ),
              ),
            );
          }),
    );
  }
}
