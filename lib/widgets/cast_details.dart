// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/models/cast_mode.dart';
import 'package:movie_app/service/api_service.dart';

class CastDetailsWidget extends StatelessWidget {
  CastDetailsWidget({super.key, required this.id});
  int? id;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: FutureBuilder(
        future: ApiService().getCast(
            castUrl:
                'https://api.themoviedb.org/3/movie/$id/credits?api_key=${Constant.apiKey}',
            context: context),
        builder: (context, AsyncSnapshot<List<CastModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text("No data available");
          } else {
            return SizedBox(
              height: 130,
              width: double.infinity,
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  CastModel casts = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(
                                '${Constant.imagePath}${casts.profilePath!}'),
                          ),
                        ),
                        Text(
                          casts.name!,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
