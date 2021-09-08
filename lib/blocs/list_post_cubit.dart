import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/model/post_model.dart';
import 'package:pattern_bloc/services/http_service.dart';

import 'list_post_state.dart';

class ListPostCubit extends  Cubit<ListPostState>{
 //ListPostCubit(ListPostState state) : super(state);
ListPostCubit():super(ListPostInit());
void apiPostList()async{
  final response =await Network.GET(Network.API_LIST, Network.paramsEmpty());
  print(response);
  if(response!=null){
    emit(ListPostLoaded(posts: Network.parsePostList(response)));

  }else{
    emit(ListPostError(error:"Couldn't fetch posts"));
  }
}
void apiPostDelete(Post post ) async{
  emit(ListPostLoading());
  final response =await Network.DEL(Network.API_DELETE+post.id.toString(), Network.paramsEmpty());
  print(response);
  if(response!=null){
    apiPostList();
  }else{
    emit(ListPostError(error: "Couldn't delete post"));
  }

}

}