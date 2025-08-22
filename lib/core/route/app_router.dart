import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tz_dashboard/feature/appui/page/dashboard_navbar_wrapper.dart';
import 'package:tz_dashboard/feature/dashboard/page/dashboardPage.dart';
import 'package:tz_dashboard/feature/location/page/locationPage.dart';
import 'package:tz_dashboard/core/route/app_router.dart';


final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/dashboard',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return DashboardNavBarWrapper(
            child: child,
            items: [
              NavItem(path: '/dashboard', label: 'Dashboard', icon: Icons.home),
              NavItem(path: '/locations', label: 'Locations', icon: Icons.location_on),
            ],
          );
        },
        routes: [
          GoRoute(
            path: '/dashboard',
            pageBuilder: (context, state) => const NoTransitionPage(child: DashboardPage()),
          ),
          GoRoute(
            path: '/locations',
            pageBuilder: (context, state) => const NoTransitionPage(child: LocationsPage()),
          ),
        ],
      ),
    ],
  );
});
