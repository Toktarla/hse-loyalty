import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hsg_loyalty/domain/entity/questionnaires/questionnaire_form_entity.dart';
import 'package:hsg_loyalty/presentation/blocs/questionnaire/questionnaire_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/questionnaire/questionnaire_state.dart';
import 'package:hsg_loyalty/presentation/widgets/fill_card_survey_widget.dart';
import 'package:hsg_loyalty/utils/helpers/ModalHelper.dart';
import 'package:hsg_loyalty/utils/helpers/snackbar_helper.dart';

import '../../../../../injection_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../blocs/questionnaire/questionnaire_event.dart';
import '../../../../widgets/text_button_widget.dart';

class FillCardScreen extends StatelessWidget {
  final String surveyId;

  const FillCardScreen({Key? key, required this.surveyId}) : super(key: key);

  bool areAllFieldsFilled(QuestionnaireFormEntity questionnaireFormEntity) {
    for (var question in questionnaireFormEntity.questions) {
      if (question.selectedAnswer == 0) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return BlocProvider<QuestionnaireBloc>(
      create: (context) => sl()..add(GetQuestionnaireByIdEvent(surveyId)),
      child: Scaffold(
        backgroundColor: AppColors.surveyCyanColor,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Заполнить карту'),
        ),
        body: BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
          builder: (context, state) {
            if (state is QuestionnaireLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is QuestionnaireError) {
              return const Center(
                child: Text("Что то пошло не так!"),
              );
            }
            if (state is QuestionnaireByIdDone) {
              var questionnaireFormEntity = state.questionnaireFormEntity;

              return Stack(
                children: [
                  ListView.builder(

                    itemCount: questionnaireFormEntity!.questions.length + 1,
                    itemBuilder: (context, index) {
                      if (index == questionnaireFormEntity.questions.length) {
                        return const SizedBox(
                          height: 80, // Extra space after the last item
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: FillSurveyCard(
                          width: width,
                          index: index,
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 5,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextButtonWidget(
                        textColor: Colors.white,
                        width: width - 20,
                        height: 45.h,
                        color: AppColors.mainColor,
                        text: 'Готово',
                        onPressed: () async {
                          if (areAllFieldsFilled(questionnaireFormEntity)) {
                            BlocProvider.of<QuestionnaireBloc>(context).add(SaveQuestionnaireEvent(state.questionnaireFormEntity!));
                            ModalHelper.showSuccessAlert(context);
                            await Future.delayed(const Duration(seconds: 3));
                            if (!context.mounted) return;
                            context.go('/surveyScreen');
                          } else {
                            SnackBarHelper.showErrorSnackbar(message: 'Заполните все поля');
                          }
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
