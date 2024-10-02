
import 'package:flutter/material.dart';
import '../../data/api_model/Results.dart';
import '../basic_files/icon_watch_list.dart';
import '../basic_files/loading_image.dart';


class PopularPosterWithBookMarkWidget extends StatelessWidget {
   PopularPosterWithBookMarkWidget(
       {
         required this.filmData,
         super.key});

  Results filmData;


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        SizedBox(
          height:200,
            width: 130,
            child:LoadingImage(imageName: filmData.posterPath,
                width:MediaQuery.of(context).size.width*0.2,
                height:MediaQuery.of(context).size.height*0.2),
            ),
         Positioned(
          top:-5,
          left:-8,
          child: IconWatchList(movieResults: filmData,),
        ),
      ],
    );
  }
}
