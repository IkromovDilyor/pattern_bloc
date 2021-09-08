

import 'package:flutter/cupertino.dart';
import 'package:pattern_bloc/model/post_model.dart';

import 'item_of_-post.dart';

Widget viewOfHome(List <Post> items , bool isLoading ){
  return Stack(
    children: [
       ListView.builder(
         itemCount: items.length,
         itemBuilder: (context, index){
           return itemOfPost(context, items[index]);
         },
       )
    ],

  );
}