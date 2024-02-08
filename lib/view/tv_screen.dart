import 'package:flutter/material.dart';
import 'package:movie_app/view/widgets/onair_tvshows.dart';
import 'package:movie_app/view/widgets/popular_tvshows.dart';
import 'package:movie_app/view/widgets/toprated_tvshows.dart';

class TvScreen extends StatefulWidget {
  const TvScreen({super.key});

  @override
  State<TvScreen> createState() => _TvScreenState();
}

class _TvScreenState extends State<TvScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TV Shows'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Top Rated TV Shows',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            const SizedBox(height: 5),
            const BuildTopRatedTvShows(),
            const SizedBox(height: 5),
            const Text('Popular TV Shows',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            const SizedBox(height: 5),
            const BuildPopularTvShows(),
            const SizedBox(height: 5),
            const Text('On The Air TV Shows',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            const SizedBox(height: 5),
            BuildOnAirTvShows(),
          ],
        ),
      ),
    );
  }
}
