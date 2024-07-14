import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../blocs/questionnaire/questionnaire_state.dart';
import '../../utils/constants/colors.dart';
import '../blocs/questionnaire/questionnaire_bloc.dart';

class FillSurveyCard extends StatefulWidget {
  final double width;
  final int index;

  const FillSurveyCard({Key? key, required this.width, required this.index})
      : super(key: key);

  @override
  State<FillSurveyCard> createState() => _FillSurveyCardState();
}

class _FillSurveyCardState extends State<FillSurveyCard> {
  int? selectedValue;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionnaireBloc, QuestionnaireState>(
      builder: (context, state) {
        if (state is QuestionnaireLoading) {
          return const Center(child: CircularProgressIndicator(),);
        }
        if (state is QuestionnaireError) {
          return const Center(child: Text("Что то пошло не так!"),);
        }
        if (state is QuestionnaireByIdDone) {
          var questionnaireFormEntity = state.questionnaireFormEntity;
          final question = questionnaireFormEntity!.questions[widget.index];
          return Container(
            width: widget.width,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.white,
              border: Border.all(color: AppColors.gray2, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.index + 1}',
                      style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor.withOpacity(0.2),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        question.text,
                        maxLines: 8,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
                  thickness: 1,
                  color: AppColors.gray,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: question.answerVariants?.length ?? 4,
                  itemBuilder: (context, variantIndex) {
                    final variant = question.answerVariants![variantIndex];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedValue = variant.id;
                          state.questionnaireFormEntity!.questions[widget.index].selectedAnswer = selectedValue;
                        });
                      },
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: Radio(
                              value: variant.id,
                              groupValue: selectedValue,
                              onChanged: (int? value) {
                                setState(() {
                                  selectedValue = value;
                                  state.questionnaireFormEntity!.questions[widget.index].selectedAnswer = selectedValue;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              variant.text,
                              style: TextStyle(fontSize: 14.sp, color: AppColors.black),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
