import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hsg_loyalty/presentation/blocs/questionnaire/questionnaire_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/questionnaire/questionnaire_event.dart';
import 'package:hsg_loyalty/presentation/blocs/questionnaire/questionnaire_state.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';

import '../../../../../injection_container.dart';
import '../../../../widgets/text_button_widget.dart';

class PassSurveyScreen extends StatelessWidget {
  final String surveyId;

  const PassSurveyScreen({Key? key, required this.surveyId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return BlocProvider<QuestionnaireBloc>(
      create: (context) => sl()..add(GetQuestionnaireByIdEvent(surveyId)),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Опросы'),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
            builder: (context, state) {
              if (state is QuestionnaireLoading) {
                return const Center(child: CircularProgressIndicator(),);
              }
              if (state is QuestionnaireError) {
                return const Center(child: Text("Что то пошло не так!"),);
              }
              if (state is QuestionnaireByIdDone) {
                final surveyData = state.questionnaireFormEntity;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Опрос',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const Divider(
                        color: AppColors.mainColor, height: 20, thickness: 1),
                    Text(
                      'Цель опроса',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      surveyData?.description ?? "Не задано",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Пройти опрос?',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        decoration: TextDecoration.combine(
                          [TextDecoration.underline],
                        ),
                        decorationColor:
                        Colors.black,
                        decorationThickness: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButtonWidget(
                      textColor: Colors.white,
                      width: width,
                      height: 45.h,
                      text: "Пройти опрос",
                      onPressed: () {
                        context.push('/surveyScreen/passSurveyScreen/fillCardScreen', extra: surveyId);
                      },
                      color: AppColors.mainColor,
                    ),
                  ],
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
