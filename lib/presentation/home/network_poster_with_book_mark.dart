import 'package:flutter/material.dart';
import '../../data/api_model/Results.dart';
import '../basic_files/icon_watch_list.dart';
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
            child:IconWatchList(movieResults: filmInformation!)

        )


      ],
    );
  }
}
