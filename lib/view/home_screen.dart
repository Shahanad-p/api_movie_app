import 'package:flutter/material.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/controller/home_provider.dart';
import 'package:movie_app/widgets/movie_ui_screen.dart';
import 'package:movie_app/widgets/trending_movies.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fetchProvider = Provider.of<HomeProvider>(context);
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
                  future: fetchProvider.getHomeScreen(
                      url: Constant.trendingUrl, context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return TrendingMovies(
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
                  future: fetchProvider.getHomeScreen(
                      url: Constant.topRatedUrl, context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return MovieUiScreen(
                        snapshot: snapshot,
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        snapshot.error.toString(),
                        style: const TextStyle(color: Colors.white),
                      ));
                    } else {
                      return const Text('');
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
                  future: fetchProvider.getHomeScreen(
                      url: Constant.nowPlayingUrl, context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return MovieUiScreen(
                        snapshot: snapshot,
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        snapshot.error.toString(),
                        style: const TextStyle(color: Colors.white),
                      ));
                    } else {
                      return const Text('');
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
                  future: fetchProvider.getHomeScreen(
                      url: Constant.upcomigUrl, context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return MovieUiScreen(
                        snapshot: snapshot,
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        snapshot.error.toString(),
                        style: const TextStyle(color: Colors.white),
                      ));
                    } else {
                      return const Text('');
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
