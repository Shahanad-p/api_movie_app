import 'package:flutter/material.dart';
import 'package:movie_app/view/widgets/top_rated_movies.dart';
import 'package:movie_app/view/widgets/trending_movies.dart';
import 'package:movie_app/view/widgets/upcoming_movied.dart';

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
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              const SizedBox(height: 10),
              buildTrendingMovies(),
              const SizedBox(height: 15),
              const Text(
                'Top Rated Movies',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              const SizedBox(height: 18),
              buildTopRatedMovies(),
              const SizedBox(height: 15),
              const Text(
                'Upcoming Movies',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              const SizedBox(height: 18),
              buildUpcomingMovies(),
            ],
          ),
        ),
      ),
    );
  }
}
