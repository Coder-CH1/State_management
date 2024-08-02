import 'package:equatable/equatable.dart';
import '../bloc/bloc_post.dart';
import '../bloc/post_state.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
  @override
  List<Object> get props => [];
}

class FetchPostEvent extends PostEvent {}