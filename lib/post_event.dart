import 'package:equatable/equatable.dart';
import 'bloc_post.dart';
import 'package:bloc/bloc.dart';
import 'package:state_management/bloc_post.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
  @override
  List<Object> get props => [];
}

class FetchPostEvent extends PostEvent {}