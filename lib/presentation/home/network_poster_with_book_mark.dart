import 'package:flutter/material.dart';

import 'package:movies_app_v2/presentation/basic_files/icon_out_watch_list.dart';
import 'package:provider/provider.dart';



import '../../data/api_model/Results.dart';

import '../../data/firestore_database/movie.dart';
import '../../data/firestore_database/movie_provider.dart';
import '../basic_files/icon_in_watch_list.dart';
import '../basic_files/loading_small_image.dart';

import '../movie_details/movie_details_widget.dart';


class NetworkPosterWithBookmark extends StatelessWidget {
  NetworkPosterWithBookmark(
       {
         required this.filmInformation,
         super.key});

  Results? filmInformation;


  @override
  Widget build(BuildContext context) {
    Movie movie = Movie(
      id:filmInformation?.id.toString(),
      title: filmInformation?.title,
      date: filmInformation?.releaseDate,
      posterName: filmInformation?.posterPath,
      isInWatchList:false,
    );


    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Container(
          child: InkWell(
            onTap: (){
              Navigator.pushNamed(context, MovieDetailsWidget.routeName,
              arguments: filmInformation
              );
            },
              child: LoadingSmallImage(imageName: filmInformation?.posterPath)
          ),
        ),
        Positioned(
            top:-5,
            left:-8,
            child:IconOutWatchList(movieResults: filmInformation!)

        )


      ],
    );
  }
}
