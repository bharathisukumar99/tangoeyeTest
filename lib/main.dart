import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'survey/bloc/survey_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurveyBloc()..add(FetchSurveyEvent()),
      child: MaterialApp(
        theme: ThemeData(
          radioTheme: const RadioThemeData(),
          colorScheme: const ColorScheme.light(
            primary: Color(0Xff00A3FF),
          ),
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        home: const Home(),
      ),
    );
  }
}
