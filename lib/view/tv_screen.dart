import 'package:flutter/material.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/controller/home_provider.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/widgets/tv_ui_screen.dart';
import 'package:provider/provider.dart';

class TvScreen extends StatefulWidget {
  const TvScreen({super.key});

  @override
  State<TvScreen> createState() => _TvScreenState();
}

class _TvScreenState extends State<TvScreen> {
  @override
  Widget build(BuildContext context) {
    final fetchProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('TV'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('On The Air TV Shows',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            const SizedBox(height: 5),
            SizedBox(
              child: FutureBuilder(
                future: fetchProvider.fetchDatas(
                    url: Constant.popularTv, context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data as List<Movies>;
                    return TvUiScreen(
                      data: data,
                      snapshot: snapshot,
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text(
                      snapshot.error.toString(),
                      style: const TextStyle(color: Colors.white),
                    ));
                  } else {
                    return const Text('');
                  }
                },
              ),
            ),
            const SizedBox(height: 5),
            const Text('Top Rated TV Shows',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            const SizedBox(height: 5),
            SizedBox(
              child: FutureBuilder(
                future: fetchProvider.fetchDatas(
                    url: Constant.topRatedTv, context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data as List<Movies>;
                    return TvUiScreen(
                      data: data,
                      snapshot: snapshot,
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text(
                      snapshot.error.toString(),
                      style: const TextStyle(color: Colors.white),
                    ));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 5),
            const Text('Popular TV Shows',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            const SizedBox(height: 5),
            SizedBox(
              child: FutureBuilder(
                future: fetchProvider.fetchDatas(
                    url: Constant.popularTv, context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data as List<Movies>;
                    return TvUiScreen(
                      data: data,
                      snapshot: snapshot,
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text(
                      snapshot.error.toString(),
                      style: const TextStyle(color: Colors.white),
                    ));
                  } else {
                    return const Text('');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
