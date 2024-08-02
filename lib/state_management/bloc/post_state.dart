import 'package:equatable/equatable.dart';
import '../bloc/bloc_post.dart';
import 'package:state_management/Networking/model.dart';

abstract class PostState extends Equatable {
  const PostState();
  @override
  List<Object> get props => [];

}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Welcome> posts;

  const PostLoaded(this.posts);
  @override
  List<Object> get props => [posts];
}

class PostError extends PostState {
  final String message;
  const PostError(this.message);

  @override
  List<Object> get props => [message];
}