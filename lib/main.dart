// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// // Theme Dark
// final darkTheme = ThemeData(
//   colorScheme:
//       ColorScheme.fromSeed(seedColor: Colors.red, brightness: Brightness.dark),
//   textTheme: GoogleFonts.latoTextTheme(
//     const TextTheme(
//       bodyLarge: TextStyle(color: Colors.white),
//       bodyMedium: TextStyle(color: Colors.white),
//       displayLarge: TextStyle(color: Colors.white, fontSize: 24),
//       displayMedium: TextStyle(color: Colors.white, fontSize: 20),
//       displaySmall: TextStyle(color: Colors.white, fontSize: 18),
//       headlineMedium: TextStyle(color: Colors.white, fontSize: 16),
//       headlineSmall: TextStyle(color: Colors.white, fontSize: 14),
//       titleLarge: TextStyle(color: Colors.white, fontSize: 12),
//     ),
//   ),
// );

// // Theme Dark
// final lightTheme = ThemeData(
//   colorScheme:
//       ColorScheme.fromSeed(seedColor: Colors.red, brightness: Brightness.light),
//   textTheme: GoogleFonts.latoTextTheme(
//     const TextTheme(
//       bodyLarge: TextStyle(color: Colors.white),
//       bodyMedium: TextStyle(color: Colors.white),
//       displayLarge: TextStyle(color: Colors.white, fontSize: 24),
//       displayMedium: TextStyle(color: Colors.white, fontSize: 20),
//       displaySmall: TextStyle(color: Colors.white, fontSize: 18),
//       headlineMedium: TextStyle(color: Colors.white, fontSize: 16),
//       headlineSmall: TextStyle(color: Colors.white, fontSize: 14),
//       titleLarge: TextStyle(color: Colors.white, fontSize: 12),
//     ),
//   ),
// );

// void main() {
//   runApp(MaterialApp());
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/tabs_screen.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const TabsScreen(),
    );
  }
}
