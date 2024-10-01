import 'package:flutter/material.dart';

import 'my_theme/my_theme_data.dart';

class IconInWatchList extends StatelessWidget {
  const IconInWatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.center, children: [
      Opacity(
          opacity: 0.8,
          child: Icon(Icons.bookmark,
              color: MyThemeData.darkPrimary, size: 40)),
      Icon(Icons.check, color: Colors.white, size: 20)
    ]);
  }
}
