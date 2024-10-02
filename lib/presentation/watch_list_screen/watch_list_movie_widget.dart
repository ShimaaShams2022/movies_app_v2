import 'package:flutter/material.dart';
import 'package:movies_app_v2/data/firestore_database/movie.dart';
import 'package:movies_app_v2/presentation/basic_files/loading_image.dart';

import '../basic_files/book_mark_with_check.dart';
import '../basic_files/my_theme/my_theme_data.dart';
import '../basic_files/utilities.dart';

class WatchListMovieWidget extends StatelessWidget {
  WatchListMovieWidget({required this.movie,super.key});
  Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 10,top: 10,bottom:10 ),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                 LoadingImage(imageName:movie.posterName, width: 100, height: 80),
                Positioned(
                    top:-5,
                    left:-9,
                    child: BookMarkWithCheck()),

                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title??"",style: MyThemeData.darkTheme.textTheme.titleSmall),
                Text(splitYear(movie.date??"2023"),style: MyThemeData.darkTheme.textTheme.bodyLarge),
                Text("Rosa Salazar, Christoph Waltz",style: MyThemeData.darkTheme.textTheme.bodyLarge)
              ],
            )
          ],
        ),
        Divider(
          color: MyThemeData.colorDivider,
          thickness: 2,
          indent: 20,
          endIndent: 20,
        )
      ],
    );
  }
}
