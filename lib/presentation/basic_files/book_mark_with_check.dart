import 'package:flutter/material.dart';

import 'my_theme/my_theme_data.dart';

class BookMarkWithCheck extends StatelessWidget {
  const BookMarkWithCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
            opacity: 0.8,
            child: Icon(Icons.bookmark,color:MyThemeData.darkSecondary,size:40,)),
        Icon(Icons.check,color:MyThemeData.textPrimaryColor,size: 20,),
      ],

    );
  }
}
