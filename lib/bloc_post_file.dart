import 'bloc_events_file.dart';
import 'bloc_states_file.dart';
import 'package:bloc/bloc.dart';
import 'networking.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final Networking _networking;
  PostsBloc(this._networking) : super(PostsInitial());

  @override

  Stream<PostsState> mapEventToState(PostsEvent, event) async* {
    if(event is LoadPosts) {
      yield PostsLoading();
      try {
        final posts = await _networking.fetchPost();
        yield PostsLoaded(posts);
      } catch (e) {
        yield PostsError(e.toString());
      }
    }
  }
}