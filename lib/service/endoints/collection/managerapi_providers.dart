import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tz_dashboard/service/endoints/collection/managerapi.dart';
import 'package:tz_dashboard/feature/dashboard/controller/dashboardController.dart';
import 'package:tz_dashboard/feature/location/controller/locationsController.dart';




final managerApiMockProvider = Provider<ManagerApi>((ref) {
  return ManagerApiMock(); 
});


final dashboardControllerProvider =
    StateNotifierProvider<DashboardController, DashboardState>((ref) {
  final service = ref.watch(managerApiMockProvider); 
  return DashboardController(service);
});


final locationsControllerProvider =
    StateNotifierProvider<LocationsController, LocationsState>((ref) {
  final service = ref.watch(managerApiMockProvider); 
  return LocationsController(service);
});
