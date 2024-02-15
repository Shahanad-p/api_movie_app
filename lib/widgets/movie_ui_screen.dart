// import 'package:flutter/material.dart';
// import 'package:movie_app/constant/constant.dart';
// import 'package:movie_app/view/detail_screen.dart';

// class MovieUiScreen extends StatelessWidget {
//   const MovieUiScreen({super.key, required this.snapshot});
//   final AsyncSnapshot snapshot;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 220,
//       width: double.infinity,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         physics: const BouncingScrollPhysics(),
//         itemCount: snapshot.data!.length,
//         itemBuilder: (context, index) => Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: GestureDetector(
//             onTap: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => DetailScreen(
//                     movies: snapshot.data[index],
//                     id: snapshot.data![index],
//                   ),
//                 ),
//               );
//             },
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(15),
//               child: SizedBox(
//                 width: 170,
//                 child: Image.network(
//                   filterQuality: FilterQuality.high,
//                   fit: BoxFit.cover,
//                   '${Constant.imagePath}${snapshot.data![index].posterPath}',
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/view/detail_screen.dart';

class MovieUiScreen extends StatelessWidget {
  const MovieUiScreen({
    super.key,
    required this.snapshot,
    required List<Movies> data,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          // Add spacing between containers
          const double containerSpacing = 10;

          return SizedBox(
            width: 200 + containerSpacing, // Add spacing to the width
            child: Padding(
              padding: const EdgeInsets.only(
                  right: containerSpacing), // Add spacing to the right
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        movies: snapshot.data[index],
                        id: snapshot.data[index].id,
                      ),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                          child: Image.network(
                            "${Constant.imagePath}${snapshot.data[index].posterPath}",
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Center(
                          child: Text(
                            snapshot.data[index].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
