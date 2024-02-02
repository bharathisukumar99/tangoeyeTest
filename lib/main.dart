import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'survey/bloc/survey_bloc.dart';
import 'survey/survey_page.dart';

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
            textTheme: GoogleFonts.poppinsTextTheme(),
            colorSchemeSeed: const Color(0xff00a3ff)),
        home: const SurveyPage(),
      ),
    );
  }
}
