import 'package:flutter/material.dart';
import 'package:tz_dashboard/feature/location/widget/StationProgressWidget.dart';
import 'package:tz_dashboard/service/endoints/model/location_card_response.dart';
// import '../../core/service/endpoints/manager/location_card_response.dart';
// import 'station_progress_widget.dart';

class LocationCardWidget extends StatelessWidget {
  final LocationCardResponse location;
  const LocationCardWidget({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(location.address, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text("Revenue: \$${location.totalRevenue}"),
            const SizedBox(height: 8),
            ...location.stationsInfo.map((s) => StationProgressWidget(station: s)),
          ],
        ),
      ),
    );
  }
}
