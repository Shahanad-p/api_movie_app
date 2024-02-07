import 'dart:async';

import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

List<String> hintTexts = [
  "Trending movies",
  "Top rated movies",
  "Current shows",
  "Upcoming movies",
  "TV shows"
];

late Timer timer;
int currentHintIndex = 0;

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController serachController = TextEditingController();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        currentHintIndex = (currentHintIndex + 1) % hintTexts.length;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white,
              width: 0.5,
            ),
          ),
          child: TextFormField(
            controller: serachController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintTexts[currentHintIndex],
              hintStyle: const TextStyle(color: Colors.white),
              contentPadding: const EdgeInsets.only(left: 15, top: 10),
            ),
          ),
        ),
      ),
    );
  }
}
