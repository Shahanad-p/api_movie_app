import 'package:flutter/material.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/view/detail_screen.dart';

class AllShows extends StatelessWidget {
  const AllShows(
      {super.key, required this.snapshot, required List<Movies> data});
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        physics:  BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) => Padding(
          padding:  EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.10),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      movies: snapshot.data![index],
                      id: snapshot.data![index].id!,
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  width: 170,
                  height: 180,
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
      ),
    );
  }
}
