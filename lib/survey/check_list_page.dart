import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tangoeye_survey/survey/bloc/survey_bloc.dart';

import '../model/survey_model.dart';

class StoreCheckListPage extends StatelessWidget {
  const StoreCheckListPage({super.key, required this.storeCheckList});
  final List<StoreCheckList> storeCheckList;
  @override
  Widget build(BuildContext context) {
    return storeCheckList.isNotEmpty
        ? ListView.builder(
            itemCount: storeCheckList.length,
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    context
                        .read<SurveyBloc>()
                        .add(SetCurrentCheckList(index: index));
                    Navigator.pushNamed(context, '/survey');
                  },
                  title: Text(
                    storeCheckList[index].checkListName,
                    textScaler: const TextScaler.linear(1.1),
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  subtitle:
                      Text(storeCheckList[index].checklistStatus.toUpperCase()),
                ),
              );
            })
        : const Center(child: Text("No Store Checklist Found"));
  }
}
