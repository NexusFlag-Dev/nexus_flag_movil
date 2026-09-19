import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config_provider.g.dart';

@Riverpod(keepAlive: true)
String baseUrl(Ref ref){
  throw UnimplementedError('No se hizo el overwrite en main');
}

@riverpod
Dio dioClient(Ref ref){
  final url = ref.watch(baseUrlProvider);
  return Dio(BaseOptions(baseUrl: url));
}