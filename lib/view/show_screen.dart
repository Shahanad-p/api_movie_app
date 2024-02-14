import 'package:flutter/material.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/controller/home_provider.dart';
import 'package:movie_app/widgets/shows_widget.dart';
import 'package:provider/provider.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({Key? key}) : super(key: key);

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  @override
  Widget build(BuildContext context) {
    final fetchProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Shows'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
        child: SizedBox(
          child: FutureBuilder(
            future: fetchProvider.fetchDatas(
                url: Constant.show, context: context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return AllShows(
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
      ),
    );
  }
}
