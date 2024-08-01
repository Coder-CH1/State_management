import 'package:equatable/equatable.dart';
import 'model.dart';

abstract class PostsEvent extends Equatable {
const PostsEvent();
@override
  List<Object> get props => [];
}

class LoadPosts extends PostsEvent {}