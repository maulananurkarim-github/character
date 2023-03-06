import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/presentation/core/constants/app_colors.dart';
import 'src/presentation/home/character_home.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CharacterHome(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: darkBlue,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
