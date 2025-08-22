import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tz_dashboard/core/di/di.dart';
import 'package:tz_dashboard/service/endoints/collection/managerapi.dart';
import 'package:tz_dashboard/service/endoints/model/location_card_response.dart';
// import '../../core/service/endpoints/manager/manager_service.dart';
// import '../../core/service/endpoints/manager/location_card_response.dart';

class LocationsState {
  final bool loading;
  final List<LocationCardResponse> locations;
  final String? error;

  LocationsState({this.loading = false, this.locations = const [], this.error});

  LocationsState copyWith({bool? loading, List<LocationCardResponse>? locations, String? error}) {
    return LocationsState(
      loading: loading ?? this.loading,
      locations: locations ?? this.locations,
      error: error ?? this.error,
    );
  }
}

class LocationsController extends StateNotifier<LocationsState> {
  final ManagerApi service;
  LocationsController(this.service) : super(LocationsState());

  Future<void> loadLocations() async {
    state = state.copyWith(loading: true);
    try {
      final data = await service.getLocationCards();
      state = state.copyWith(loading: false, locations: data);
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
    }
  }
}

final locationsControllerProvider =
    StateNotifierProvider<LocationsController, LocationsState>((ref) {
  final service = ref.read(managerApiMockProvider);
  return LocationsController(service);
});
