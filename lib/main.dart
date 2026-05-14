import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/main_screen.dart';

void main() => runApp(const ObanAnime());

class ObanAnime extends StatelessWidget {
  const ObanAnime({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ObanAnime',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF050505),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent, brightness: Brightness.dark),
        textTheme: GoogleFonts.exo2TextTheme(ThemeData.dark().textTheme),
      ),
      home: const MainScreen(),
    );
  }
}
