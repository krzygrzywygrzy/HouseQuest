import 'package:flutter_riverpod/flutter_riverpod.dart';

// TRUE - darkmode
// FALSE - lightmode

class ThemeProvider extends StateNotifier<bool> {
  ThemeProvider() : super(true);

  toogle() {
    state = !state;
  }
}

final themeProvider =
    StateNotifierProvider<ThemeProvider, bool>((ref) => ThemeProvider());
