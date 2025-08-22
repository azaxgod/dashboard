import 'package:flutter/material.dart';
import 'package:tz_dashboard/service/endoints/model/location_card_response.dart';
// import '../model/location_card_response.dart';

class StationProgressWidget extends StatelessWidget {
  final StationInfo station;
  const StationProgressWidget({super.key, required this.station});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          station.currentOnlineStatus == 1 ? Icons.check_circle : Icons.cancel,
          color: station.currentOnlineStatus == 1 ? Colors.green : Colors.red,
        ),
        const SizedBox(width: 8),
        Text('Cabinet ${station.cabinetId} - ${station.thirtyDaysOnlinePercentage}% last 30 days'),
      ],
    );
  }
}
