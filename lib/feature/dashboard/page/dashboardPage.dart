import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tz_dashboard/feature/dashboard/controller/dashboardController.dart';
import 'package:tz_dashboard/feature/location/widget/total_locations_card.dart';
// import '../controller/dashboard_controller.dart';
import '../widget/average_online_card.dart';
// import '../widget/total_locations_card.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  String selectedPeriod = 'All Time';

  final List<String> periods = ['All Time', 'Last 7 Days', 'Last 30 Days'];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dashboardControllerProvider.notifier).loadDashboard(period: selectedPeriod);
    });
  }

  void onPeriodChanged(String period) {
    setState(() {
      selectedPeriod = period;
    });
    ref.read(dashboardControllerProvider.notifier).loadDashboard(period: period);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dashboardControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: state.loading
          ? const Center(child: CircularProgressIndicator())
          : state.error != null
              ? Center(child: Text("Error: ${state.error}"))
              : Column(
                  children: [
                    // Период для сортировки
                    Container(
                      margin: const EdgeInsets.all(16),
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: periods.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          final period = periods[index];
                          final selected = period == selectedPeriod;
                          return GestureDetector(
                            onTap: () => onPeriodChanged(period),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: selected ? Colors.blue : Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                period,
                                style: TextStyle(
                                  color: selected ? Colors.white : Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Карточки
                    if (state.dashboard != null) ...[
                      AverageOnlineCard(
                        average: state.dashboard!.averageLocationOnline,
                        period: selectedPeriod, 
                      ),
                      TotalLocationsCard(
                        total: state.dashboard!.totalLocationsCount,
                        period: selectedPeriod, 
                      ),
                    ] else
                      const Center(child: CircularProgressIndicator()),
                  ],
                ),
    );
  }
}