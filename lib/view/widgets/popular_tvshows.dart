import 'package:flutter/material.dart';
import 'package:movie_app/view/detail_screen.dart';

class BuildPopularTvShows extends StatelessWidget {
  const BuildPopularTvShows({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DetailScreen()));
              },
              child: Container(
                height: 200,
                width: 180,
                color: Colors.green,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
