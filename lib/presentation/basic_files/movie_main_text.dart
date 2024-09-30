import 'package:flutter/material.dart';

import '../../data/api_model/Results.dart';
import 'check_adult.dart';
import 'my_theme/my_theme_data.dart';
import 'utilities.dart';

class MovieMainText extends StatelessWidget {
   MovieMainText({required this.adsMovie,super.key});

  Results adsMovie;




  @override
  Widget build(BuildContext context) {

    bool isAdult=adsMovie.adult ?? false;
    return  Column(
      crossAxisAlignment:CrossAxisAlignment.start,

      children: [
        Text(
          adsMovie.originalTitle??"",
          style: MyThemeData.darkTheme.textTheme.bodyLarge,
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                splitYear(adsMovie.releaseDate??""),
                style: MyThemeData.darkTheme.textTheme.bodyMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(checkAdult(adsMovie.adult??false) ,
                style: MyThemeData.darkTheme.textTheme.bodyMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                adsMovie.originalLanguage??"",
                style: MyThemeData.darkTheme.textTheme.bodyMedium,
              ),
            )
          ],
        ),
      ],
    );
  }
}
