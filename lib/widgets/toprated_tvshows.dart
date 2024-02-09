import 'package:flutter/material.dart';


class BuildTopRatedTvShows extends StatelessWidget {
  const BuildTopRatedTvShows({super.key});

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
            child: GestureDetector(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => DetailScreen(movies: ,)));
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
