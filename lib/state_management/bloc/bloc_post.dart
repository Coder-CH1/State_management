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

// abstract class TodayEvent {}
// class FetchPosts extends TodayEvent {
// }
//
// abstract class TodayState {}
// class TodayInitial extends TodayState {}
// class TodayLoading extends TodayState {}
// class TodayLoaded extends TodayState {
//   final List<Welcome> posts;
//   TodayLoaded(this.posts);
// }
// class TodayError extends TodayState {
//   final String message;
//   TodayError(this.message);
// }
//
// class TodayBloc extends Bloc<TodayEvent, TodayState> {
//   final Networking networking;
//   TodayBloc(this.networking) : super(TodayInitial());
//   @override
//   Stream<TodayState> mapEventToState(TodayState event) async* {
//     if (event is FetchPosts) {
//       yield TodayLoading();
//       try {
//         final post = await networking.fetchPost();
//         yield TodayLoaded(post);
//       } catch (e) {
//         yield TodayError(e.toString());
//       }
//     }
//     }
//   }