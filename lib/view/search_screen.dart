import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/controller/search_provider.dart';
import 'package:movie_app/view/detail_screen.dart';
import 'package:provider/provider.dart';

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
    final searchcontroller = Provider.of<SearchProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
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
                  onChanged: (value) {
                    searchcontroller.searchMovies(value);
                  },
                  controller: searchcontroller.queryController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintTexts[currentHintIndex],
                    hintStyle: const TextStyle(color: Colors.white),
                    contentPadding: const EdgeInsets.only(left: 15, top: 10),
                    suffixIcon: searchcontroller.queryController.text.isNotEmpty
                        ? IconButton(
                            color: Colors.red,
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              searchcontroller.queryController.clear();
                              searchcontroller.searchMovies('');
                            },
                          )
                        : null,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 700,
                  child: GridView.builder(
                    itemCount: searchcontroller.searchResults.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            crossAxisCount: 3,
                            childAspectRatio: 1 / 1.4),
                    itemBuilder: (context, index) {
                      final searchdata = searchcontroller.searchResults[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                    movies: searchdata,
                                    // id: searchdata.id!,
                                  )));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "${Constant.imagePath}${searchdata.posterPath}"),
                                    fit: BoxFit.fill,
                                    filterQuality: FilterQuality.high),
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
