import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DashboardNavBarWrapper extends ConsumerWidget {
  final Widget child;
  final List<NavItem> items;

  const DashboardNavBarWrapper({
    super.key,
    required this.child,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = GoRouter.of(context);
  final location = GoRouter.of(context).routerDelegate.currentConfiguration?.uri.toString() ?? '';

    final currentIndex = items.indexWhere((item) => location.startsWith(item.path));

    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade300, width: 0.3)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(items.length, (index) {
            final item = items[index];
            final selected = currentIndex == index;

            return GestureDetector(
              onTap: () {
                if (!selected) router.go(item.path);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: selected ? Colors.blue.shade50 : Colors.transparent,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  children: [
                    Icon(item.icon, color: selected ? Colors.blue : Colors.grey),
                    if (selected)
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          item.label,
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class NavItem {
  final String path;
  final String label;
  final IconData icon;

  NavItem({required this.path, required this.label, required this.icon});
}
