import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:tz_dashboard/core/di/di.dart';
import 'package:tz_dashboard/service/endoints/collection/managerapi.dart';
import 'package:tz_dashboard/service/endoints/collection/managerapi_providers.dart';
import 'package:tz_dashboard/service/endoints/model/dashboard_response.dart';
// import '../../core/service/endpoints/manager/manager_service.dart';
// import '../../core/service/endpoints/manager/dashboard_response.dart';


class DashboardState {
  final bool loading;
  final DashboardResponse? dashboard;
  final String? error;

  DashboardState({this.loading = false, this.dashboard, this.error});

  DashboardState copyWith({bool? loading, DashboardResponse? dashboard, String? error}) {
    return DashboardState(
      loading: loading ?? this.loading,
      dashboard: dashboard ?? this.dashboard,
      error: error ?? this.error,
    );
  }
}


class DashboardController extends StateNotifier<DashboardState> {
  // final ManagerApi service;
  final ManagerApi service;
  DashboardController(this.service) : super(DashboardState());

  Future<void> loadDashboard({String? period}) async {
    state = state.copyWith(loading: true);
    try {
      final data = await service.getDashboard(period: period);
      state = state.copyWith(loading: false, dashboard: data);
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
    }
  }
}

// final dashboardRealControllerProvider =
//     StateNotifierProvider<DashboardController, DashboardState>((ref) {
//   final service = ref.read(managerApiProvider);
//   return DashboardController();});

final dashboardControllerProvider =
    StateNotifierProvider<DashboardController, DashboardState>((ref) {
  final service = ref.read(managerApiMockProvider);
  return DashboardController(service);
  
});
