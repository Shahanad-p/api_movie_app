import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/view/upcoming_details.dart';

Widget buildUpcomingMovies() {
  return SizedBox(
    width: double.infinity,
    child: CarouselSlider.builder(
      itemCount: 10,
      options: CarouselOptions(
          height: 250,
          autoPlay: true,
          viewportFraction: 0.55,
          pageSnapping: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1)),
      itemBuilder: (context, itemIndex, pageViewIndex) => ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const UpcomingDetails()));
          },
          child: Container(
            height: 350,
            width: 200,
            color: Colors.green,
          ),
        ),
      ),
    ),
  );
}
