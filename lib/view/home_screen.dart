import 'package:flutter/material.dart';
import 'package:movie_app/api/api.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/view/widgets/now_playing_movies.dart';
import 'package:movie_app/view/widgets/top_rated_movies.dart';
import 'package:movie_app/view/widgets/trending_movies.dart';
import 'package:movie_app/view/widgets/upcoming_movied.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movies>> trendingMovies;
  late Future<List<Movies>> topRatedMovies;
  late Future<List<Movies>> nowPlayingMovies;
  late Future<List<Movies>> upcomingMovies;
  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    nowPlayingMovies = Api().getNowPlayingMovies();
    upcomingMovies = Api().getUpcomingMovies();
  }

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
              const Text('Trending Movies',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              const SizedBox(height: 10),
              SizedBox(
                child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return BuildTrendingMovies(
                        snapshot: snapshot,
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        snapshot.error.toString(),
                        style: const TextStyle(color: Colors.white),
                      ));
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 5),
              const Text('Top Rated Movies',
                  style: TextStyle(
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              const SizedBox(height: 5),
              SizedBox(
                child: FutureBuilder(
                  future: topRatedMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return BuildTopRatedMovies(
                        snapshot: snapshot,
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        snapshot.error.toString(),
                        style: const TextStyle(color: Colors.white),
                      ));
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 5),
              const Text('Now Playing',
                  style: TextStyle(
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              const SizedBox(height: 10),
              SizedBox(
                child: FutureBuilder(
                  future: nowPlayingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return BuilNowPlayingMovies(
                        snapshot: snapshot,
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        snapshot.error.toString(),
                        style: const TextStyle(color: Colors.white),
                      ));
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Upcoming Movies',
                style: TextStyle(
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(height: 5),
              SizedBox(
                child: FutureBuilder(
                  future: upcomingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return BuildUpcomingMovies(
                        snapshot: snapshot,
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        snapshot.error.toString(),
                        style: const TextStyle(color: Colors.white),
                      ));
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
