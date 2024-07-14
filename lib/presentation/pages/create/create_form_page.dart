import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hsg_loyalty/domain/entity/create/create_qorgay_entity.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_event.dart';
import 'package:hsg_loyalty/presentation/widgets/text_button_widget.dart';
import '../../../injection_container.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/constants.dart';
import '../../../utils/mixins/input_widget_mixin.dart';
import '../../cubits/create_qorgay_cubit.dart';
import '../../widgets/form_item_card.dart';

class CreateFormPage extends StatefulWidget with InputWidgetMixin {

  CreateFormPage({super.key});

  @override
  State<CreateFormPage> createState() => _CreateFormPageState();
}

class _CreateFormPageState extends State<CreateFormPage> with InputWidgetMixin {
  final TextEditingController fioController = TextEditingController();

  final TextEditingController supervisedObjectController = TextEditingController();

  final TextEditingController contractorController = TextEditingController();

  final TextEditingController observationTypeController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController case9Controller = TextEditingController();

  final TextEditingController case11Controller = TextEditingController();

  final TextEditingController case12Controller = TextEditingController();

  final TextEditingController case13Controller = TextEditingController();

  final TextEditingController case16Controller = TextEditingController();

  final FocusNode fioFocusNode = FocusNode();
  final FocusNode case9FocusNode = FocusNode();
  final FocusNode case11FocusNode = FocusNode();
  final FocusNode case12FocusNode = FocusNode();
  final FocusNode case13FocusNode = FocusNode();
  final FocusNode case16FocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: width,
              color: AppColors.color_quest_special.withOpacity(0.5),
              child: ListView.builder(
                itemCount: 16,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final inputWidget = createInputWidget(
                    index,
                    context: context,
                    fioController: fioController,
                    fioFocusNode: fioFocusNode,
                    case9FocusNode: case9FocusNode,
                    case11FocusNode: case11FocusNode,
                    case12FocusNode: case12FocusNode,
                    case13FocusNode: case13FocusNode,
                    case16FocusNode: case16FocusNode,
                    phoneNumberController: phoneNumberController,
                    case8Controller: case9Controller,
                    case10Controller: case11Controller,
                    case11Controller: case12Controller,
                    case12Controller: case13Controller,
                    case15Controller: case16Controller,
                    observationTypeController: observationTypeController,
                    contractorController: contractorController,
                    supervisedObjectController: supervisedObjectController
                  );

                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: FormItemCard(
                      numeration: index + 1,
                      title: inputPageTitles[index],
                      action: inputWidget,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextButtonWidget(
                width: width / 2,
                height: 60,
                text: 'Сохранить',
                onPressed: () {
                  BlocProvider.of<CreateQorgayCubit>(context).updateInput(
                      CreateQorgayEntity(
                        fullName: fioController.text,
                        contractor: contractorController.text,
                        supervisedObject: supervisedObjectController.text,
                        suggestion: case9Controller.text,
                        informTo: case16Controller.text,
                        actionToEncourage: case13Controller.text,
                        measure: case12Controller.text,
                        possibleConsequence: case11Controller.text,
                      )
                  );

                  // Create Qorgay Method
                  BlocProvider.of<QorgayBloc>(context).add(AddQorgayEvent(BlocProvider.of<CreateQorgayCubit>(context).accumulatedData));

                  // called createQorwayMethod
                  BlocProvider.of<CreateQorgayCubit>(context).printAccumulatedData();
                  BlocProvider.of<CreateQorgayCubit>(context).clearInput();

                  if (context.mounted){
                    context.pop();
                  }
                },
                color: AppColors.mainColor,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

