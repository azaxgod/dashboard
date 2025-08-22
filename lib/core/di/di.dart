import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:tz_dashboard/service/endoints/collection/managerapi.dart';


Future <void> initDependecies()async{

}

final dioProvider = Provider<Dio>((ref){
  return Dio(BaseOptions
  (baseUrl: '',
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 1),
  ));
});

final managerApiProvider = Provider<ManagerApi>((ref) {
  final dio = ref.watch(dioProvider);
  return ManagerApi(dio);

});
final managerApiMockProvider = Provider<ManagerApi>((ref) {
  return ManagerApiMock(); //
});