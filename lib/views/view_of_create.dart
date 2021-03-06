import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/blocs/create_post_cubit.dart';
import 'package:pattern_bloc/model/post_model.dart';

Widget viewOfCreate(bool isLoading , BuildContext context, TextEditingController titleController,
    TextEditingController bodyController
    ){
  return Container(
    padding: EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  )
              ),
            ),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(
                  hintText: "body",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  )
              ),
            ),
            SizedBox(height: 10,),
            FlatButton(
              onPressed: (){
                Post post=Post(
                  fullname:titleController.text.toString(),
                  number: bodyController.text.toString(),

                );
               BlocProvider.of<CreatePostCubit>(context).apiPostCreate(post);



              },
              color: Colors.blue,
              child: Text("Create a post",style: TextStyle(color: Colors.white),),
            )

          ],
        ),
        isLoading? Center(
          child: CircularProgressIndicator(),
        ):SizedBox.shrink()
      ],
    ),
  );
}