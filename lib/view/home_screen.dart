import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/view/trending_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/Purple Modern Future Destiny Movie Poster.png',
          fit: BoxFit.cover,
          height: 60,
          filterQuality: FilterQuality.high,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Trending Movies',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              SizedBox(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
