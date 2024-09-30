import 'package:flutter/material.dart';

import '../basic_files/my_theme/my_theme_data.dart';
import 'watch_all_List_widget.dart';


class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});
  static const String routeName = "WatchScreen";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height*0.1
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0,bottom: 0,left: 25,right:10 ),
          child: Text("Watch List",style: MyThemeData.darkTheme.textTheme.headlineMedium),
        ),
        WatchAllListWidget(),

      ],

    );
  }
}
