import 'package:flutter/material.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/models/movies_model.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({
    super.key,
    required this.movies,
    // required this.id,
  });
  final Movies movies;
  // int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: Container(
              margin: const EdgeInsets.only(top: 15, left: 15, right: 8),
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            backgroundColor: Colors.black,
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movies.title!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 5.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                child: Image.network(
                  '${Constant.imagePath}${movies.posterPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  // SizedBox(height: 10),
                  // SizedBox(
                  //   height: 130,
                  //   child: FutureBuilder(
                  //     // future:Provider.of<CastProvider>(context,listen: false).loadCast(context, id),
                  //     future: ApiService().getCast(
                  //       castUrl:
                  //           'https://api.themoviedb.org/3/movie/$id/credits?api_key=e43fdbf4130175e0f229d0945d5f13c9',
                  //       context: context,
                  //     ),
                  //     builder:
                  //         (context, AsyncSnapshot<List<CastModel>> snapshot) {
                  //       if (snapshot.connectionState ==
                  //           ConnectionState.waiting) {
                  //         return const CircularProgressIndicator();
                  //       } else if (snapshot.hasError) {
                  //         return Text("Error: ${snapshot.error}");
                  //       } else if (!snapshot.hasData ||
                  //           snapshot.data!.isEmpty) {
                  //         return const Text("No data available");
                  //       } else {
                  //         return SizedBox(
                  //           height: 130,
                  //           width: double.infinity,
                  //           child: ListView.builder(
                  //             itemCount: snapshot.data!.length,
                  //             scrollDirection: Axis.horizontal,
                  //             physics: const BouncingScrollPhysics(),
                  //             itemBuilder: (context, index) {
                  //               CastModel casts = snapshot.data![index];
                  //               return Padding(
                  //                 padding: const EdgeInsets.only(left: 10),
                  //                 child: Column(
                  //                   children: [
                  //                     Padding(
                  //                       padding:
                  //                           const EdgeInsets.only(left: 12),
                  //                       child: Padding(
                  //                         padding: const EdgeInsets.all(2.0),
                  //                         child: CircleAvatar(
                  //                           radius: 45,
                  //                           backgroundImage: NetworkImage(
                  //                               '${Constant.imagePath}${casts.profilePath!}'),
                  //                         ),
                  //                       ),
                  //                     ),
                  //                     Text(casts.name!),
                  //                   ],
                  //                 ),
                  //               );
                  //             },
                  //           ),
                  //         );
                  //       }
                  //     },
                  //   ),
                  // ),
                  const Text(
                    'Ovreview',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    movies.overview!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                const Text(
                                  'Release date: ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                                Text(
                                  movies.releaseDate!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(children: [
                              const Text(
                                'Rating: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              ),
                              Text(
                                '${movies.voteAverage?.toStringAsFixed(1)}/10',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ]),
                          )
                        ]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
