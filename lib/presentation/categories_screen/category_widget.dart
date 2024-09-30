import 'package:flutter/material.dart';

import '../basic_files/my_theme/my_theme_data.dart';
import '../basic_files/utilities.dart';
import 'category_details_screen.dart';

class CategoryWidget extends StatelessWidget {
   CategoryWidget({required this.categoryName,required this.categoryId,super.key});

  final String categoryName;
  final String categoryId;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, CategoryDetailsScreen.routeName,
            arguments: GenresNameWithId(id:categoryId,name:categoryName));
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(getFullPathImage("categoryImage.png")),
          Text(categoryName,style: MyThemeData.darkTheme.textTheme.bodyLarge?.copyWith(fontWeight:FontWeight.w600),)
        ],
      ),
    );
  }
}

class GenresNameWithId{
  String name;
  String id;
  GenresNameWithId({required this.name,required this.id});
}