import 'package:flutter/material.dart';

import '../basic_files/my_theme/my_theme_data.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0,bottom: 5,left: 40,right: 40),
      child: TextFormField(
        onChanged: (query){
          if(query.isNotEmpty){

          }
            },
        style: MyThemeData.darkTheme.textTheme.bodyLarge,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle:MyThemeData.darkTheme.textTheme.bodyLarge?.copyWith(color:  MyThemeData.boxMovieTextColor),
          prefixIcon: const Icon(Icons.search,color: MyThemeData.iconColorBasic,),
          filled: true,
          fillColor: MyThemeData.boxMovieBorderColor,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: MyThemeData.boxMovieTextColor
            ),
            borderRadius: BorderRadius.circular(40)
          ),
          focusedBorder:OutlineInputBorder(
              borderSide: const BorderSide(
                  color: MyThemeData.boxMovieTextColor
              ),
              borderRadius: BorderRadius.circular(40)
          ),

        ),
      ),
    );
  }
}
