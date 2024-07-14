import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/domain/entity/vitalrule/answers_dto_entity.dart';
import 'package:hsg_loyalty/domain/entity/vitalrule/comments_dto_entity.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';
import 'package:hsg_loyalty/utils/helpers/dialog_helper.dart';

import '../../domain/entity/vitalrule/user_answers_dto_entity.dart';
import '../cubits/create_answer_vital_rule_cubit.dart';

class CustomRadioContainer extends StatelessWidget {
  final double width;
  final String title;
  final int questionIndex;

  const CustomRadioContainer({
    Key? key,
    required this.width,
    required this.title,
    required this.questionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> radioValue1 = ValueNotifier<bool>(false);
    final ValueNotifier<bool> radioValue2 = ValueNotifier<bool>(false);
    final ValueNotifier<bool> radioValue3 = ValueNotifier<bool>(false);
    final TextEditingController commentController = TextEditingController();

    String answerValue = "-1";

    void selectRadio(ValueNotifier<bool> selectedNotifier, List<ValueNotifier<bool>> otherNotifiers) {
      selectedNotifier.value = true;

      if (selectedNotifier == radioValue1) {
        answerValue = "1";
      } else if (selectedNotifier == radioValue2) {
        answerValue = "2";
      } else if (selectedNotifier == radioValue3) {
        answerValue = "3";
      }

      context.read<CreateAnswerVitalRuleCubit>().updateUserAnswers(
        AnswersDtoEntity(
          question: questionIndex.toString(),
          answer: answerValue,
        ),
      );

      for (var notifier in otherNotifiers) {
        notifier.value = false;
      }
    }

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => selectRadio(radioValue1, [radioValue2, radioValue3]),
                        child: const Icon(Icons.check_circle_sharp, size: 40, color: Colors.green),
                      ),
                      ValueListenableBuilder<bool>(
                        valueListenable: radioValue1,
                        builder: (context, value, child) {
                          return Radio(
                            value: true,
                            groupValue: value ? true : null,
                            onChanged: (newValue) {
                              selectRadio(radioValue1, [radioValue2, radioValue3]);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => selectRadio(radioValue2, [radioValue1, radioValue3]),
                        child: const Icon(Icons.warning_amber_rounded, size: 50, color: Colors.redAccent),
                      ),
                      ValueListenableBuilder<bool>(
                        valueListenable: radioValue2,
                        builder: (context, value, child) {
                          return Radio(
                            value: true,
                            groupValue: value ? true : null,
                            onChanged: (newValue) {
                              selectRadio(radioValue2, [radioValue1, radioValue3]);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => selectRadio(radioValue3, [radioValue1, radioValue2]),
                        child: const Icon(Icons.block_flipped, size: 40, color: Colors.black),
                      ),
                      ValueListenableBuilder<bool>(
                        valueListenable: radioValue3,
                        builder: (context, value, child) {
                          return Radio(
                            value: true,
                            groupValue: value ? true : null,
                            onChanged: (newValue) {
                              selectRadio(radioValue3, [radioValue1, radioValue2]);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Комментарий'),
                      content:  TextField(
                        controller: commentController,
                        decoration: const InputDecoration(
                          hintText: 'Введите комментарий',
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text('Отмена'),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<CreateAnswerVitalRuleCubit>().updateComments(
                                CommentsDtoEntity(
                                    comment: "comment_$questionIndex",
                                    date: DateTime.now(),
                                    value: commentController.text
                                ));
                            commentController.clear();
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text('Создать'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text(
                  'Комментарий',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
