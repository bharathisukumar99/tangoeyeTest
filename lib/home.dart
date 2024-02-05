import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tangoeye_survey/survey/bloc/survey_bloc.dart';
import 'package:tangoeye_survey/survey/check_list_page.dart';

import 'package:tangoeye_survey/utils/enums.dart';

import 'utils/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<SurveyBloc>().add(FetchSurveyEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context),
      body: BlocBuilder<SurveyBloc, SurveyState>(
        builder: (context, state) {
          switch (state.surveyStatus) {
            case FetchStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case FetchStatus.success:
              return StoreCheckListPage(
                storeCheckList: state.storeCheckList,
              );
            case FetchStatus.failure:
              return const Text('No Sections found');
            case FetchStatus.initial:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
