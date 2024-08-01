import 'package:riverpod/riverpod.dart';
import 'package:dio/dio.dart';
import 'bloc_post_file.dart';
import 'networking.dart';

final dioProvider = Provider((ref) => Dio());

final networkingProvider = Provider<Networking>((ref) {
  final dio = ref.watch(dioProvider);
  return Networking();
});

final postsBlocProvider = Provider<PostsBloc>((ref) {
  final network = ref.watch(networkingProvider);
  return PostsBloc(network);
});