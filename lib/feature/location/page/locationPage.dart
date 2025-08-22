import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tz_dashboard/feature/location/controller/locationsController.dart';
import 'package:tz_dashboard/feature/location/widget/locationCardWidget.dart';
// import '../controller/locations_controller.dart';
// import '../widget/location_card_widget.dart';

// class LocationsPage extends ConsumerWidget {
//   const LocationsPage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(locationsControllerProvider);

//     return Scaffold(
//       appBar: AppBar(title: const Text("Locations")),
//       body: state.loading
//           ? const Center(child: CircularProgressIndicator())
//           : state.error != null
//               ? Center(child: Text("Error: ${state.error}"))
//               : ListView.builder(
//                   itemCount: state.locations.length,
//                   itemBuilder: (context, index) {
//                     final location = state.locations[index];
//                     return LocationCardWidget(location: location);
//                   },
//                 ),
//     );
//   }
// }
class LocationsPage extends ConsumerStatefulWidget {
  const LocationsPage({super.key});

  @override
  ConsumerState<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends ConsumerState<LocationsPage> {
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(locationsControllerProvider.notifier).loadLocations();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(locationsControllerProvider);

    // Фильтруем список по поисковому запросу
    final filteredLocations = state.locations
        .where((loc) =>
            loc.address.toLowerCase().contains(searchQuery.toLowerCase()) ||
            loc.locationNumber.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Locations")),
      body: Column(
        children: [
          // Search Field
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by address or location number',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: state.loading
                ? const Center(child: CircularProgressIndicator())
                : state.error != null
                    ? Center(child: Text("Error: ${state.error}"))
                    : filteredLocations.isEmpty
                        ? const Center(child: Text("No locations found"))
                        : ListView.builder(
                            itemCount: filteredLocations.length,
                            itemBuilder: (context, index) {
                              final location = filteredLocations[index];
                              return LocationCardWidget(location: location);
                            },
                          ),
          ),
        ],
      ),
    );
  }
}