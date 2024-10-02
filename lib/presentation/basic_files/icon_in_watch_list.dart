import 'package:flutter/material.dart';
import 'my_theme/my_theme_data.dart';

class IconInWatchList extends StatefulWidget {
  IconInWatchList({super.key});


  @override
  State<IconInWatchList> createState() => _IconInWatchListState();
}

class _IconInWatchListState extends State<IconInWatchList> {
  @override
  Widget build(BuildContext context) {

    return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Opacity(
              opacity:0.8,
              child: Icon(Icons.bookmark,color: MyThemeData.darkPrimary,size:40)),
          Icon(Icons.check, color: Colors.white, size: 20,
          )
        ],
      );
  }
}
