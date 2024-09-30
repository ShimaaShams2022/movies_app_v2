
import 'package:flutter/material.dart';


import 'my_theme/my_theme_data.dart';

class BoxMovieType extends StatelessWidget {
   BoxMovieType(this.genresName,{super.key});
String genresName;
  @override
  Widget build(BuildContext context) {
    return  Container(

        decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(

                color: MyThemeData.boxMovieBorderColor
            )
        ) ,
        child: Text(genresName,textAlign: TextAlign.center,style: MyThemeData.darkTheme.textTheme.bodyMedium?.copyWith(color: MyThemeData.boxMovieTextColor))
    );
  }
}
