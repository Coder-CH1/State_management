import 'package:riverpod/riverpod.dart';
import 'package:dio/dio.dart';
import 'package:state_management/bloc/bloc_post.dart';
import '../Networking/networking.dart';

final dioProvider = Provider((ref) => Dio());

final networkingProvider = Provider<Networking>((ref) {
  return Networking();
});

final postBlocProvider = Provider<PostBloc>((ref) {
  return PostBloc(ref.watch(networkingProvider));
});
