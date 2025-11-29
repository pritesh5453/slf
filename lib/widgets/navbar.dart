import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart' show StateProvider;
import 'package:slf/components/homeScreen.dart';
import 'package:slf/components/loan_screen.dart';
import 'package:slf/components/pre_approved_screen.dart';

enum BottomTab { home, loan, preapproved }

/// Global bottom nav provider
final bottomTabProvider = StateProvider<BottomTab>((ref) => BottomTab.home);

class MainHomeScreen extends ConsumerStatefulWidget {
  final BottomTab? initialTab;

  const MainHomeScreen({super.key, this.initialTab});

  @override
  ConsumerState<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends ConsumerState<MainHomeScreen> {
  @override
  void initState() {
    super.initState();

    /// Set initial tab (default = home)
    Future.microtask(() {
      ref.read(bottomTabProvider.notifier).state =
          widget.initialTab ?? BottomTab.home;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedTab = ref.watch(bottomTabProvider);

    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [
          /// ⭐ Persistent pages (NO RELOAD) – using IndexedStack
          Padding(
            padding: const EdgeInsets.only(bottom: 90),
            child: IndexedStack(
              index: BottomTab.values.indexOf(selectedTab),
              children: const [
                HomeScreen(),
                ActiveLoansScreen(),
                PreApprovedLoansScreen(),
              ],
            ),
          ),

          /// ⭐ Bottom Navigation Bar
          Positioned(
            left: 16,
            right: 16,
            bottom: 5,
            child: SafeArea(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  color: Colors.white,
                  child: BottomNavigationBar(
                    currentIndex: BottomTab.values.indexOf(selectedTab),
                    onTap: (index) {
                      ref.read(bottomTabProvider.notifier).state =
                          BottomTab.values[index];
                    },

                    backgroundColor: Colors.white,
                    type: BottomNavigationBarType.fixed,
                    elevation: 0,
                    selectedItemColor: Colors.blue,
                    unselectedItemColor: Colors.grey.shade700,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    iconSize: 0,

                    items: [
                      _navItemIcon(Icons.home, selectedTab == BottomTab.home),
                      _navItemIcon(Icons.wallet, selectedTab == BottomTab.loan),
                      _navItemIcon(
                        Icons.approval,
                        selectedTab == BottomTab.preapproved,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// NORMAL ICON TAB
  BottomNavigationBarItem _navItemIcon(IconData icon, bool isSelected) {
    return BottomNavigationBarItem(
      icon: CircleAvatar(
        radius: 22,
        backgroundColor: isSelected ? Colors.blue : Colors.transparent,
        child: Icon(
          icon,
          size: 24,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
      label: "",
    );
  }
}
