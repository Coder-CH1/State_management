import 'package:equatable/equatable.dart';
import 'model.dart';

abstract class PostsState extends Equatable {
  const PostsState();
  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostLoaded extends PostsState {
  final List<Welcome> posts;
  const PostLoaded(this.posts);
  @override
  List<Object> get props => [posts];
}

class PostsError extends PostsState {
  final String message;
  const PostsError(this.message);
  @override
  List<Object> get props => [message];
}