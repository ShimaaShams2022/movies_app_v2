import 'package:flutter/material.dart';
import 'package:movies_app_v2/data/firestore_database/movies_collection.dart';

import '../../data/firestore_database/movie.dart';
import 'watch_list_movie_widget.dart';

class WatchAllListWidget extends StatelessWidget {
   WatchAllListWidget(this.moviesList, {super.key});

   List<Movie> moviesList;

  List imagesList=[
    "searchResultImage.png",
    "searchResultImage.png",
    "searchResultImage.png",
    "searchResultImage.png",
    "searchResultImage.png",
    "searchResultImage.png",


  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(itemCount:moviesList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context,index){
            return WatchListMovieWidget(movie: moviesList[index]);
          },
        ),
      ),
    );
  }
}
