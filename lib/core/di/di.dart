import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:tz_dashboard/service/endoints/collection/managerapi.dart';


Future <void> initDependecies()async{

}

final dioProvider = Provider<Dio>((ref){
  return Dio(BaseOptions
  (baseUrl: 'https://goldfish-app-3lf7u.ondigitalocean.app',
  headers: {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhZG1pblR5cGUiOiJNQU5BR0VSIiwic3ViIjoidGVzdCIsImlhdCI6MTc1NTg3MjM0MCwiZXhwIjoxNzU1ODc1MzQwfQ.ZOhTzHtRLPliBLq_cc_M3m3zuj6uHpBZhTG8WO7omVA',
  },
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 5),
  ));
});

final managerApiProvider = Provider<ManagerApi>((ref) {
  final dio = ref.watch(dioProvider);
  return ManagerApi(dio);

});
// final managerApiMockProvider = Provider<ManagerApi>((ref) {
//   return ManagerApiMock(); //
// });