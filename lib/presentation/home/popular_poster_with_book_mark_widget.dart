
import 'package:flutter/material.dart';

import '../basic_files/loading_image.dart';
import '../basic_files/my_theme/my_theme_data.dart';

class PopularPosterWithBookMarkWidget extends StatelessWidget {
   PopularPosterWithBookMarkWidget(
       {
         required this.imageName,
         required this.addWatchList,
         super.key});

  String imageName;
  bool addWatchList=false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        SizedBox(
          height:200,
            width: 130,
            child:LoadingImage(imageName: imageName,
                width:MediaQuery.of(context).size.width*0.2,
                height:MediaQuery.of(context).size.height*0.2),
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
