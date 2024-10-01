import 'package:flutter/material.dart';

import 'my_theme/my_theme_data.dart';

class ChooseBookMark extends StatelessWidget {
  ChooseBookMark({required this.inWatchList, super.key});

  bool? inWatchList;

  @override
  Widget build(BuildContext context) {
    if (inWatchList == true) {
      return  Stack(alignment: AlignmentDirectional.center, children: [
        Opacity(
            opacity: 0.8,
            child: Icon(Icons.bookmark,
                color: MyThemeData.darkPrimary, size: 40)),
        Icon(Icons.check, color: Colors.white, size: 20)
      ]);
    }
    else {
      return Stack(alignment: AlignmentDirectional.center, children: [
      Opacity(
          opacity: 0.8,
          child: Icon(Icons.bookmark,
              color: MyThemeData.bookMarkBackground, size: 40)),
      Icon(Icons.add, color: Colors.white, size: 20)
    ]);
    }
  }
}

