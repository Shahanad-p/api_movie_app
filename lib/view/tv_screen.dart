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
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Top Rated TV Shows',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            SizedBox(height: 5),
            BuildTopRatedTvShows(),
            SizedBox(height: 5),
            Text('Popular TV Shows',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            SizedBox(height: 5),
            BuildPopularTvShows(),
            SizedBox(height: 5),
            Text('On The Air TV Shows',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            SizedBox(height: 5),
            BuildOnAirTvShows(),
          ],
        ),
      ),
    );
  }
}
