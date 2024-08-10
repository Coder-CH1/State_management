import 'package:state_management/Networking/networking.dart';
import 'package:bloc/bloc.dart';
import 'post_state.dart';
import 'post_event.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final Networking _networking;

  PostBloc(this._networking) : super(PostInitial()) {
    on<FetchPostEvent>((event, emit) async{
emit(PostLoading());
try {
  final posts = await _networking.fetchPost();
  emit(PostLoaded(posts));
} catch (e){
  emit(PostError(e.toString()));
}
    });
  }
}
