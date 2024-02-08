import 'package:flutter/material.dart';
import 'package:movie_app/api/constant/constant.dart';
import 'package:movie_app/view/trending_details.dart';

class BuildUpcomingMovies extends StatelessWidget {
  const BuildUpcomingMovies({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TrendingDetails()));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                width: 170,
                child: Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${Constant.imagePath}${snapshot.data![index].posterPath}',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
