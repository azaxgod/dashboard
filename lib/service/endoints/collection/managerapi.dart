// import 'dart:async';
// import 'package:dio/dio.dart';
// import '../model/dashboard_response.dart';
// import '../model/location_card_response.dart';

// class ManagerApi {
//   final Dio _dio;

//   static const String basePath = '/api/v1/manager';

//   ManagerApi(this._dio);


//   Future<DashboardResponse> getDashboard({
//     String? period,
//     DateTime? fromDate,
//     DateTime? toDate,
//   }) async {
//     final queryParameters = <String, dynamic>{};

//     if (period != null) {
//       queryParameters['period'] = period;
//     } else if (fromDate != null && toDate != null) {
//       queryParameters['from'] = fromDate.toIso8601String();
//       queryParameters['to'] = toDate.toIso8601String();
//     }

//     print(' Sending GET $basePath/locations with params: $queryParameters');
//     final response = await _dio.get('$basePath/locations', queryParameters: queryParameters);
//       print(' Response status: ${response.statusCode}');
//   print('Response data: ${response.data}');
//     return DashboardResponse.fromJson(response.data);

    
//   }


//   Future<List<LocationCardResponse>> getLocationCards() async {
    
//     final response = await _dio.get('$basePath/locations/cards');
//       print('Response status: ${response.statusCode}');
//   print('Response data: ${response.data}');
//     return (response.data as List)
//         .map((e) => LocationCardResponse.fromJson(e))
//         .toList();
//   }
// }
// class ManagerApiMock extends ManagerApi {
//   ManagerApiMock() : super(Dio()); 
//   @override
//   Future<DashboardResponse> getDashboard({String? period, DateTime? fromDate, DateTime? toDate}) async {
//     await Future.delayed(const Duration(seconds: 1));
//     return DashboardResponse(averageLocationOnline: 90, totalLocationsCount: 5);
//   }

//   @override
//   Future<List<LocationCardResponse>> getLocationCards() async {
//     await Future.delayed(const Duration(seconds: 1));
//     return [
//       LocationCardResponse(
//         locationId: 'loc_12345',
//         stationsInfo: [
//           StationInfo(
//             cabinetId: 'cab_001',
//             currentOnlineStatus: 1,
//             thirtyDaysOnlinePercentage: 95,
//             onlinePercentageSinceInstallation: 98,
//           ),
//         ],
//         address: '123 Main Street, Kyiv',
//         locationNumber: 'LC-2024',
//         totalRevenue: 15234.75,
//         shopStart: '08:00',
//         shopEnd: '22:00',
//         locationType: 'Mall',
//         hasCompetitors: true,
//         isGoodVisibility: false,
//         area: 'Central',
//         taughtStaffCount: 5,
//         locationCategory: 'Premium',
//         establishmentNumber: 'EST-9087',
//       ),
//     ];
//   }
// }
import 'dart:async';
import 'package:dio/dio.dart';
import '../model/dashboard_response.dart';
import '../model/location_card_response.dart';

class ManagerApi {
  final Dio _dio;

  static const String basePath = '/api/v1/manager';

  ManagerApi(this._dio);

 Future<DashboardResponse> getDashboard({String timeRange = 'TODAY', int from = 1, int to = 1}) async {
  try {
    final response = await _dio.get(
      '/api/v1/manager/locations',
      queryParameters: {
        'timeRange': timeRange,
        'from': from,
        'to': to,
      },
    );

    print('Response status: ${response.statusCode}');
    print('Response data: ${response.data}');

    return DashboardResponse.fromJson(response.data);
  } catch (e) {
    print('[ManagerApi] Error in getDashboard: $e');
    rethrow;
  }
}

  Future<List<LocationCardResponse>> getLocationCards({
    String? timeRange,
    int? from,
    int? to,
  }) async {
    try {
      final queryParameters = <String, dynamic>{};
      if (timeRange != null) queryParameters['timeRange'] = timeRange;
      if (from != null) queryParameters['from'] = from;
      if (to != null) queryParameters['to'] = to;

      final response = await _dio.get(
        '$basePath/locations/cards',
        queryParameters: queryParameters,
      );

      print('[ManagerApi] GET /locations/cards => ${response.statusCode}');
      print(response.data);

      return (response.data as List)
          .map((e) => LocationCardResponse.fromJson(e))
          .toList();
    } catch (e, st) {
      print('[ManagerApi] Error in getLocationCards: $e');
      print(st);
      rethrow;
    }
  }
}
