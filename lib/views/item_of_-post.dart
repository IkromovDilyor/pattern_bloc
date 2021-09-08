import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_bloc/blocs/list_post_cubit.dart';
import 'package:pattern_bloc/model/post_model.dart';
import 'package:pattern_bloc/pages/update_page.dart';

Widget itemOfPost(BuildContext context,Post post){
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actionExtentRatio: 0.25,
    child: Container(
      padding: EdgeInsets.only(left: 20,right: 20, top:20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.number.toUpperCase(),style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
          ),
          SizedBox(height: 5,),
          Text(post.fullname)

        ],
      ),
    ),
    actions:<Widget> [
      IconSlideAction(
        caption: "Update",
        color: Colors.indigo,
        icon:Icons.edit,
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePage(title: post.number, body: post.fullname)));
        },
      )

    ],
    secondaryActions:<Widget> [
      IconSlideAction(
        caption: "Delete",
        color: Colors.red,
        icon: Icons.delete,
        onTap: (){
          BlocProvider.of<ListPostCubit>(context).apiPostDelete(post);

        },
      )

    ],
  );
}