import 'package:riverpod/riverpod.dart';
import 'package:dio/dio.dart';
import 'model.dart';
import 'networking.dart';

final dioProvider = Provider((ref) => Dio());

final networkingProvider = Provider<Networking>((ref) {
  return Networking();
});

final postProvider = FutureProvider<List<Welcome>>((ref) async {
  final networking = ref.watch(networkingProvider);
  return networking.fetchPost();
});
