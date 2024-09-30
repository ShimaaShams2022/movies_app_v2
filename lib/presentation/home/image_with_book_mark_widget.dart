
import 'package:flutter/material.dart';

import '../basic_files/my_theme/my_theme_data.dart';
import '../movie_details/movie_details_widget.dart';

class ImageWithBookMarkWidget extends StatelessWidget {
   ImageWithBookMarkWidget(
       {
         required this.imageName,
         required this.addWatchList,
         super.key});

  String? imageName;
  bool addWatchList=false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, MovieDetailsWidget.routeName);
          },
            child:  Image.network('https://image.tmdb.org/t/p/w500$imageName')
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
