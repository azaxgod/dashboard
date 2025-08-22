import 'package:flutter/material.dart';

class AverageOnlineCard extends StatelessWidget {
  final int average;
  final String? period;
  const AverageOnlineCard({super.key, required this.average,this.period});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            // Круговой индикатор
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    value: average / 100,
                    strokeWidth: 8,
                    backgroundColor: Colors.blue.shade100,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  '$average%',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  
                ),
                
              ],
            ),
            const SizedBox(width: 24),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Average Online',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Avarage Station online.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  if( period!= null)
                  Text(period!,style: TextStyle(color: Colors.green),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
