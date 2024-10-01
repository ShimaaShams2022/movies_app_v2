import 'package:flutter/material.dart';

import 'my_theme/my_theme_data.dart';

class IconOutWatchList extends StatelessWidget {
  const IconOutWatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.center, children: [
      Opacity(
          opacity: 0.8,
          child: Icon(Icons.bookmark,
              color: MyThemeData.bookMarkBackground, size: 40)),
      Icon(Icons.add, color: Colors.white, size: 20)
    ]);
  }
}
