import 'package:flutter/material.dart';
import 'package:movies_app_v2/data/firestore_model/movies_database.dart';
import 'package:movies_app_v2/data/providers/movies_provider.dart';
import 'package:provider/provider.dart';


import '../../data/api_model/Results.dart';
import '../basic_files/choose_book_mark.dart';
import '../basic_files/icon_in_watch_list.dart';
import '../basic_files/icon_out_watch_list.dart';
import '../basic_files/loading_small_image.dart';
import '../movie_details/movie_details_widget.dart';
import '../watch_list_screen/watch_list_view_model.dart';

class NetworkPosterWithBookmark extends StatefulWidget {
  NetworkPosterWithBookmark(
       {
         required this.filmInformation,
         super.key});

  Results? filmInformation;

  @override
  State<NetworkPosterWithBookmark> createState() => _NetworkPosterWithBookmarkState();
}

class _NetworkPosterWithBookmarkState extends State<NetworkPosterWithBookmark> {
  @override
  Widget build(BuildContext context) {

    SavedMovie? movie;

    bool? checkResult=false;
    movie?.isInWatchList=false;
    movie?.movieId=widget.filmInformation?.id.toString();
    movie?.movieDate=widget.filmInformation?.releaseDate;
    movie?.movieImage=widget.filmInformation?.posterPath;

    var watchlistProvider = Provider.of<MoviesProvider>(context);

    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, MovieDetailsWidget.routeName,
            arguments: widget.filmInformation
            );
          },
            child: LoadingSmallImage(imageName: widget.filmInformation?.posterPath)
        ),
        Positioned(
          top:-5,
          left: -8,
          child:InkWell(
            onTap: () async {
              checkResult=await watchlistProvider.checkMovie(movie!);
            if(checkResult==false){
              watchlistProvider.addMovie(movie);
            }
            else {
              watchlistProvider.removeMovie(movie);
            }
              setState((){
              });
            },

              child:checkResult ? IconInWatchList():IconOutWatchList()
          ),
        ),
      ],
    );
  }
}
