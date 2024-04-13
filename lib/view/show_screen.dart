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
        title: Text('Shows'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 12.10, right: 12.10, top: 11.10),
        child: SizedBox(
          child: FutureBuilder(
            future:
                fetchProvider.fetchDatas(url: Constant.show, context: context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data;
                return AllShows(
                  data: data,
                  snapshot: snapshot,
                );
              } else if (snapshot.hasError) {
                return Center(
                    child: Text(
                  snapshot.error.toString(),
                  style: TextStyle(color: Colors.white),
                ));
              } else {
                return Center(
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
