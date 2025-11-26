import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

/// Bottom Tabs ENUM
enum BottomTab { home, attendance, profile }

/// Provider to track current selected tab
final bottomTabProvider = StateProvider<BottomTab>((ref) => BottomTab.home);
