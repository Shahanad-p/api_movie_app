import 'package:flutter/material.dart';

class TrendingDetails extends StatefulWidget {
  const TrendingDetails({super.key});

  @override
  State<TrendingDetails> createState() => _TrendingDetailsState();
}

class _TrendingDetailsState extends State<TrendingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Trending',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
