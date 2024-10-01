
import 'package:flutter/material.dart';

import '../basic_files/choose_book_mark.dart';
import '../basic_files/my_theme/my_theme_data.dart';
import '../movie_details/movie_details_widget.dart';

class ImageWithBookMarkWidget extends StatefulWidget {
   ImageWithBookMarkWidget(
       {
         required this.imageName,
         required this.addWatchList,
         super.key});

  String? imageName;
  bool addWatchList;

  @override
  State<ImageWithBookMarkWidget> createState() => _ImageWithBookMarkWidgetState();
}

class _ImageWithBookMarkWidgetState extends State<ImageWithBookMarkWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, MovieDetailsWidget.routeName);
          },
            child:  Image.network('https://image.tmdb.org/t/p/w500${widget.imageName}')
        ),
        Positioned(
          top:-5,
          left: -8,
          child: InkWell(
            onTap: (){
              setState(() {
                widget.addWatchList =! widget.addWatchList;
              });
            },
              child: ChooseBookMark(inWatchList:widget.addWatchList ,)
          ),
        ),
      ],
    );
  }
}
