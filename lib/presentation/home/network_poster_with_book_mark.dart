import 'package:flutter/material.dart';


import '../../data/api_model/Results.dart';
import '../basic_files/loading_small_image.dart';
import '../basic_files/my_theme/my_theme_data.dart';
import '../movie_details/movie_details_widget.dart';

class NetworkPosterWithBookmark extends StatelessWidget {
  NetworkPosterWithBookmark(
       {
         required this.filmInformation,
         required this.addWatchList,
         super.key});

  Results? filmInformation;
  bool? addWatchList=false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, MovieDetailsWidget.routeName,
            arguments: filmInformation
            );
          },
            child: LoadingSmallImage(imageName: filmInformation?.posterPath)
        ),
        const Positioned(
          top:-5,
          left: -8,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Opacity(
                opacity:0.8,
                  child: Icon(Icons.bookmark,color: MyThemeData.bookMarkBackground,size:40)),
              Icon(Icons.add, color: Colors.white, size: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}
