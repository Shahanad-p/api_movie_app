import 'package:flutter/material.dart';

class TopRatedDetails extends StatefulWidget {
  const TopRatedDetails({super.key});

  @override
  State<TopRatedDetails> createState() => _TopRatedDetailsState();
}

class _TopRatedDetailsState extends State<TopRatedDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Top Rated Movies',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
