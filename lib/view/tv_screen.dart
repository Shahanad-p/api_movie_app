import 'package:flutter/material.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/controller/home_provider.dart';
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
        title: Text('TV'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(15.10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('On The Air TV Shows',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              SizedBox(height: 5),
              SizedBox(
                child: FutureBuilder(
                  future: fetchProvider.fetchDatas(
                      url: Constant.popularTv, context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data;
                      return TvUiScreen(
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
                      return Text('');
                    }
                  },
                ),
              ),
              SizedBox(height: 5.5),
              Text('Top Rated TV Shows',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              SizedBox(height: 5),
              SizedBox(
                child: FutureBuilder(
                  future: fetchProvider.fetchDatas(
                      url: Constant.topRatedTv, context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data;
                      return TvUiScreen(
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
              SizedBox(height: 5),
              Text('Popular TV Shows',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              SizedBox(height: 5),
              SizedBox(
                child: FutureBuilder(
                  future: fetchProvider.fetchDatas(
                      url: Constant.popularTv, context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data;
                      return TvUiScreen(
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
                      return Text('');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
