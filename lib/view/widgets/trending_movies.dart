import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/view/trending_details.dart';

Widget buildTrendingMovies() {
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
      itemBuilder: (context, itemIndex, pageViewIndex) => ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TrendingDetails()));
          },
          child: Container(
            height: 350,
            width: 210,
            color: Colors.green,
          ),
        ),
      ),
    ),
  );
}
