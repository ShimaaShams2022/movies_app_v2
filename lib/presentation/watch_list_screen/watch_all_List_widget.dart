import 'package:flutter/material.dart';
import 'package:movies_app_v2/presentation/watch_list_screen/watch_list_view_model.dart';
import 'package:provider/provider.dart';

import 'watch_list_movie_widget.dart';

class WatchAllListWidget extends StatelessWidget {
   WatchAllListWidget({super.key});

  List imagesList=[
    "searchResultImage.png",
    "searchResultImage.png",
    "searchResultImage.png",
    "searchResultImage.png",
    "searchResultImage.png",
    "searchResultImage.png",


  ];



  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(itemCount:imagesList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context,index){
            return WatchListMovieWidget(imageName: imagesList[index]);
          },
        ),
      ),
    );
  }
}
