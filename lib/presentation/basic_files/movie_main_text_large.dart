import 'package:flutter/material.dart';

import '../../data/api_model/Results.dart';
import 'check_adult.dart';
import 'my_theme/my_theme_data.dart';
import 'utilities.dart';

class MovieMainTextLarge extends StatelessWidget {
   MovieMainTextLarge(this.filmInformation,{super.key});

  Results? filmInformation;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,

        children: [
          Text(
            filmInformation?.title??"",
            style: MyThemeData.darkTheme.textTheme.titleMedium,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
               splitYear(filmInformation?.releaseDate??""),
                style: MyThemeData.darkTheme.textTheme.bodyMedium?.
                copyWith(color: MyThemeData.smallTextColor),
              ),
              SizedBox(width:MediaQuery.of(context).size.width*0.02),
              Text(
                checkAdult(filmInformation?.adult?? false),
                style: MyThemeData.darkTheme.textTheme.bodyMedium?.
                copyWith(color: MyThemeData.smallTextColor),
              ),
              SizedBox(width:MediaQuery.of(context).size.width*0.02),
              Text(
                "2h 52m",
                style: MyThemeData.darkTheme.textTheme.bodyMedium?.
                copyWith(color: MyThemeData.smallTextColor),
              )
            ],
          ),
        ],
      ),
    );
  }
}
