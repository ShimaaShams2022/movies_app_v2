
import 'package:flutter/material.dart';

import '../basic_files/choose_book_mark.dart';
import '../basic_files/loading_image.dart';
import '../basic_files/my_theme/my_theme_data.dart';

class PopularPosterWithBookMarkWidget extends StatefulWidget {
   PopularPosterWithBookMarkWidget(
       {
         required this.imageName,
         required this.addWatchList,
         super.key});

  String imageName;
  bool addWatchList;

  @override
  State<PopularPosterWithBookMarkWidget> createState() => _PopularPosterWithBookMarkWidgetState();
}

class _PopularPosterWithBookMarkWidgetState extends State<PopularPosterWithBookMarkWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        SizedBox(
          height:200,
            width: 130,
            child:LoadingImage(imageName: widget.imageName,
                width:MediaQuery.of(context).size.width*0.2,
                height:MediaQuery.of(context).size.height*0.2),
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
              child: ChooseBookMark(inWatchList: widget.addWatchList)
          ),
        ),
      ],
    );
  }
}
