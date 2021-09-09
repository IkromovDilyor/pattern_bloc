import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pattern_bloc/pages/home_page.dart';

import 'blocs/list_post_cubit.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>ListPostCubit())
        ],
        child: HomePage(),
      ),
      routes: {
        HomePage.id:(context)=>HomePage(),
        //CreatePage.id:(context)=>CreatePage()
      },
    );
  }
}




