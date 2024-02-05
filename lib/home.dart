import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tangoeye_survey/survey/bloc/survey_bloc.dart';

import 'package:tangoeye_survey/utils/enums.dart';
import 'package:tangoeye_survey/survey/view/survey_page_view.dart';

import 'survey/survey_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Store Maintenance',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: BlocBuilder<SurveyBloc, SurveyState>(
        builder: (context, state) {
          switch (state.surveyStatus) {
            case FetchStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case FetchStatus.success:
              return SurveyPage(sections: state.sections);
            case FetchStatus.failure:
              return const Text('No Sections found');
            case FetchStatus.initial:
              return const SizedBox();
          }
        },
      ),
      bottomNavigationBar: FilledButton(
        onPressed: () {
          context.read<SurveyBloc>().add(ValidationChecker());
        },
        child: const Text('Review Answers'),
      ),
    );
  }
}
