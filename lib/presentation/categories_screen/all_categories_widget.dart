import 'package:flutter/material.dart';


import '../../data/api_model/Genres.dart';
import 'category_widget.dart';

class AllCategoriesWidget extends StatelessWidget {
   AllCategoriesWidget(this.categories,{super.key});

   List<Genres>? categories;



  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
         mainAxisSpacing: 15,
         crossAxisSpacing: 1,
         childAspectRatio: 1.7,
      ),
      itemCount:categories?.length,
        itemBuilder: (context,index){
        return CategoryWidget(
          categoryName: categories?[index].name??"",
          categoryId:categories?[index].id.toString()??"");
        },
      ),
    );
  }
}
