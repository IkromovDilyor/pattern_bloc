import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/blocs/update_post_cubit.dart';
import 'package:pattern_bloc/blocs/update_post_state.dart';
import 'package:pattern_bloc/model/post_model.dart';
import 'package:pattern_bloc/views/view_of_update.dart';

class UpdatePage extends StatelessWidget {
  Post post;

  UpdatePage({this.post});

  TextEditingController titleController = new TextEditingController();
  TextEditingController bodyController = new TextEditingController();

  _finish(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }

  @override
  Widget build(BuildContext context) {
    titleController.text = post.fullname;
    bodyController.text = post.number;

    return BlocProvider(
      create: (context) => UpdatePostCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Update a Post"),
        ),
        body: BlocBuilder<UpdatePostCubit, UpdatePostState>(
          builder: (BuildContext context, UpdatePostState state) {
            if(state is UpdatePostLoading){
              String title = titleController.text.toString();
              String body = bodyController.text.toString();
              Post post = Post(id: this.post.id,fullname: title, number: body, userId: this.post.userId);
              return viewOfUpdate(true,context,post, titleController, bodyController);
            }
            if(state is UpdatePostLoaded){
              _finish(context);
            }
            if(state is UpdatePostError){

            }
            return viewOfUpdate(false,context,post, titleController, bodyController);
          },
        ),
      ),
    );
  }

}