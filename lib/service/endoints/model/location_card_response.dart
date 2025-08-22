class StationInfo {
  final String cabinetId;
  final int currentOnlineStatus;
  final int thirtyDaysOnlinePercentage;
  final int onlinePercentageSinceInstallation;

  StationInfo({
    required this.cabinetId,
    required this.currentOnlineStatus,
    required this.thirtyDaysOnlinePercentage,
    required this.onlinePercentageSinceInstallation,
  });

  factory StationInfo.fromJson(Map<String, dynamic> json) {
    return StationInfo(
      cabinetId: json['cabinetId'],
      currentOnlineStatus: json['currentOnlineStatus'],
      thirtyDaysOnlinePercentage: json['thirtyDaysOnlinePercentage'],
      onlinePercentageSinceInstallation:
          json['onlinePercentageSinceInstallation'],
    );
  }
}

class LocationCardResponse {
  final String locationId;
  final List<StationInfo> stationsInfo;
  final String address;
  final String locationNumber;
  final double totalRevenue;
  final String shopStart;
  final String shopEnd;
  final String locationType;
  final bool hasCompetitors;
  final bool isGoodVisibility;
  final String area;
  final int taughtStaffCount;
  final String locationCategory;
  final String establishmentNumber;

  LocationCardResponse({
    required this.locationId,
    required this.stationsInfo,
    required this.address,
    required this.locationNumber,
    required this.totalRevenue,
    required this.shopStart,
    required this.shopEnd,
    required this.locationType,
    required this.hasCompetitors,
    required this.isGoodVisibility,
    required this.area,
    required this.taughtStaffCount,
    required this.locationCategory,
    required this.establishmentNumber,
  });

  factory LocationCardResponse.fromJson(Map<String, dynamic> json) {
    return LocationCardResponse(
      locationId: json['locationId'],
      stationsInfo: (json['stationsInfo'] as List)
          .map((e) => StationInfo.fromJson(e))
          .toList(),
      address: json['address'],
      locationNumber: json['locationNumber'],
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      shopStart: json['shopStart'],
      shopEnd: json['shopEnd'],
      locationType: json['locationType'],
      hasCompetitors: json['hasCompetitors'],
      isGoodVisibility: json['isGoodVisibility'],
      area: json['area'],
      taughtStaffCount: json['taughtStaffCount'],
      locationCategory: json['locationCategory'],
      establishmentNumber: json['establishmentNumber'],
    );
  }
}
