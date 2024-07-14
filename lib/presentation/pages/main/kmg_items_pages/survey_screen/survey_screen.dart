import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hsg_loyalty/presentation/blocs/questionnaire/questionnaire_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/questionnaire/questionnaire_event.dart';
import 'package:hsg_loyalty/presentation/blocs/questionnaire/questionnaire_state.dart';
import 'package:hsg_loyalty/presentation/widgets/survey_card_item_widget.dart';

import '../../../../../injection_container.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuestionnaireBloc>(
  create: (context) => sl()..add(const GetQuestionnairesEvent(1)),
  child: Scaffold(
      appBar: AppBar(
        title: const Text('Опросы'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
          builder: (context, state) {
            if (state is QuestionnaireLoading) {
              return const Center(child: CircularProgressIndicator(),);
            }
            if (state is QuestionnaireError) {
              return const Center(child: Text("Что то пошло не так!"),);
            }
            if (state is QuestionnairesDone) {
              final questionData = state.questionnaireEntity;
              return SurveyItemCard(
                onTap: () {
                  context.push('/surveyScreen/passSurveyScreen', extra: questionData?.id.toString() ?? "Не задано");
                },
                forHostHeight: 20,
                forHostWidth: 60,
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height / 9,
                trailingWidth: 100,
                trailingHeight: 50,
                title: questionData?.name ?? "Не задано",
                date: questionData?.insertDate ?? "Не задано",
                forGuest: true,
              );

            }
            return Container();
          },
        ),
      ),
    ),
);
  }
}
