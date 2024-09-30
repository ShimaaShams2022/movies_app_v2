import 'package:flutter/material.dart';

import '../../data/api_model/Results.dart';
import '../basic_files/loading_image.dart';
import '../basic_files/my_theme/my_theme_data.dart';
import '../basic_files/utilities.dart';

class SearchResultMovieWidget extends StatelessWidget {
   SearchResultMovieWidget({required this.film,super.key});
  Results? film;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 10,top: 10,bottom:10 ),
              child:LoadingImage(imageName: film?.posterPath, width: 80, height:120,)
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.6,
                  child: Text(film?.originalTitle??"",style: MyThemeData.darkTheme.textTheme.titleSmall,
                  softWrap: true,
                    maxLines: 2,
                  ),
                ),
                Text(splitYear(film?.releaseDate??""),style: MyThemeData.darkTheme.textTheme.bodyLarge),
                Text("Rosa Salazar, Christoph Waltz",style: MyThemeData.darkTheme.textTheme.bodyLarge)
              ],
            )
          ],
        ),
        const Divider(
          color: MyThemeData.colorDivider,
          thickness: 2,
          indent: 20,
          endIndent: 20,
        )
      ],
    );
  }
}
