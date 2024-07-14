import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/domain/entity/create/create_qorgay_entity.dart';
import 'package:hsg_loyalty/presentation/cubits/create_qorgay_cubit.dart';

import '../../../widgets/option_widget.dart';

class PickTwoVariantPage extends StatelessWidget {
  final ValueNotifier<String> selectedOption = ValueNotifier('');
  final String fieldToUpdate;

  PickTwoVariantPage({super.key, required this.fieldToUpdate});

  void handleOptionChange(BuildContext context, String value) {
    selectedOption.value = value;
    final bool boolValue = value == 'Да';
    CreateQorgayEntity updatedEntity;

    switch (fieldToUpdate) {
      case 'isDiscussed':
        updatedEntity = CreateQorgayEntity(isDiscussed: boolValue);
        break;
      case 'isEliminated':
        updatedEntity = CreateQorgayEntity(isEliminated: boolValue);
        break;
      case 'isInformed':
        updatedEntity = CreateQorgayEntity(isInformed: boolValue);
        break;
      default:
        updatedEntity = CreateQorgayEntity();
    }

    BlocProvider.of<CreateQorgayCubit>(context).updateInput(updatedEntity);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OptionWidget(
            option: 'Да',
            color: Colors.green,
            selectedOption: selectedOption,
            onChanged: (value) => handleOptionChange(context, value),
          ),
          const SizedBox(width: 50,),
          OptionWidget(
            option: 'Нет',
            color: Colors.red,
            selectedOption: selectedOption,
            onChanged: (value) => handleOptionChange(context, value),
          ),
        ],
      ),
    );
  }
}
