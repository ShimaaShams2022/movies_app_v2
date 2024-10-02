import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/firestore_database/movie_provider.dart';
import 'my_theme/my_theme_data.dart';

class IconOutWatchList extends StatelessWidget {
   IconOutWatchList({super.key});




  @override
  Widget build(BuildContext context) {
    var moviesProvider = Provider.of<MovieProvider>(context, listen: true);
    return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Opacity(
              opacity: 0.8,
              child: Icon(Icons.bookmark, color: MyThemeData.bookMarkBackground,
                  size: 40)),
          Icon(Icons.add, color: Colors.white, size: 20,)
        ]
    );
  }
}
