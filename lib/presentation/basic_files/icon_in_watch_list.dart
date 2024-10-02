import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/api_model/Results.dart';
import '../../data/firestore_database/movie.dart';
import '../../data/firestore_database/movie_provider.dart';
import 'my_theme/my_theme_data.dart';

class IconInWatchList extends StatelessWidget {
  IconInWatchList({required this.movieResults,super.key});

  Results movieResults;

  @override
  Widget build(BuildContext context) {
    Movie movie = Movie(
      id:movieResults.id.toString(),
      title: movieResults.title,
      date: movieResults.releaseDate,
      posterName: movieResults.posterPath,
      isInWatchList:false,
    );
    var moviesProvider= Provider.of<MovieProvider>(context,listen: true);

    return InkWell(
      onTap: (){
        movie.isInWatchList=false;
        moviesProvider.removeMovie(movie);
        print("hjfdgshdgfshdgfhdsgd");
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Opacity(
              opacity:0.8,
              child: Icon(Icons.bookmark,color: MyThemeData.darkPrimary,size:40)),
          Icon(Icons.check, color: Colors.white, size: 20,
          )
        ],
      ),
    );
  }
}
