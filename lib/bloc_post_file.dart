import 'model.dart';
import 'package:state_management/networking.dart';
import 'package:bloc/bloc.dart';

abstract class TodayEvent {}
class FetchPosts extends TodayEvent {

}

abstract class TodayState {}
class TodayInitial extends TodayState {}
class TodayLoading extends TodayState {}
class TodayLoaded extends TodayState {
  final List<Welcome> posts;
  TodayLoaded(this.posts);
}
class TodayError extends TodayState {
  final String message;
  TodayError(this.message);
}

class TodayBloc extends Bloc<TodayEvent, TodayState> {
  final Networking networking;
  TodayBloc(this.networking) : super(TodayInitial());
  @override
  Stream<TodayState> mapEventToState(PostEvent, event) async* {
    if (event is FetchPosts) {
      yield TodayLoading();
      try {
        final post = await networking.fetchPost();
        yield TodayLoaded(post);
      } catch (e) {
        yield TodayError(e.toString());
      }
    }
    }
  }