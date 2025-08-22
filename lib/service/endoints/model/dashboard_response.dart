class DashboardResponse {
  final int averageLocationOnline;
  final int totalLocationsCount;

  DashboardResponse({
    required this.averageLocationOnline,
    required this.totalLocationsCount,
  });

  factory DashboardResponse.fromJson(Map<String,dynamic> json){
    return DashboardResponse(
      averageLocationOnline: json['averageLocationOnline'], 
      totalLocationsCount: json['totalLocationsCount'],
    );
  }
}
