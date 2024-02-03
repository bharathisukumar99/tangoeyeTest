import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tangoeye_survey/utils/constants.dart';
import 'package:tangoeye_survey/utils/enums.dart';
import 'package:tangoeye_survey/survey/view/survey_page_view.dart';

import 'bloc/survey_bloc.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({super.key});

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
              return SurveyPageView(
                sections: state.sections,
              );
            case FetchStatus.failure:
              return const Center(child: CircularProgressIndicator());
            case FetchStatus.initial:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: FilledButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
          }
        },
        child: const Text('Review Answers'),
      ),
    );
  }
}
