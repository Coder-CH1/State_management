import 'package:riverpod/riverpod.dart';
import 'package:dio/dio.dart';
import 'package:state_management/model.dart';
import 'bloc_post_file.dart';
import 'networking.dart';

final dioProvider = Provider((ref) => Dio());

final postProvider = FutureProvider<List<Welcome>>((ref) async {
  final networking = ref.watch(networkingProvider);
  return networking.fetchPost();
});

final networkingProvider = Provider<Networking>((ref) {
  return Networking();
});