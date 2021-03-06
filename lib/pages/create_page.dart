import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/blocs/create_post_cubit.dart';
import 'package:pattern_bloc/blocs/create_post_state.dart';
import 'package:pattern_bloc/views/view_of_create.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  bool isLoading = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  _finish(BuildContext context ){
    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      Navigator.pop(context, "result");
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatePostCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Post"),
        ),
        body: BlocBuilder<CreatePostCubit, CreatePostState>(
          builder: (BuildContext context, CreatePostState state){
            if(state is CreatePostLoading){
              return viewOfCreate(true, context, titleController, bodyController);
            }
            if(state is CreatePostLoaded){
             _finish(context);
            }
            if(state is CreatePostError){

            }
            return viewOfCreate(false, context, titleController, bodyController);
          },

          )
      ),
    );
  }
}
