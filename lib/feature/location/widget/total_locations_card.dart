import 'package:flutter/material.dart';

class TotalLocationsCard extends StatelessWidget {
  final int total;
  final String? period;

  const TotalLocationsCard({super.key, required this.total,this.period});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: const Icon(Icons.location_on, size: 32, color: Colors.green),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$total',
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Total Locations',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
