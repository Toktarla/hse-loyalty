import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hsg_loyalty/domain/entity/vitalrule/user_answers_dto_entity.dart';
import 'package:hsg_loyalty/injection_container.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_event.dart';
import 'package:hsg_loyalty/presentation/blocs/vitalrules/vital_rules_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/vitalrules/vital_rules_event.dart';
import 'package:hsg_loyalty/presentation/blocs/vitalrules/vital_rules_state.dart';
import 'package:hsg_loyalty/presentation/cubits/create_answer_vital_rule_cubit.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';
import 'package:hsg_loyalty/utils/helpers/snackbar_helper.dart';
import 'package:hsg_loyalty/utils/mixins/date_time_mixin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../blocs/profile/profile_bloc.dart';
import '../../../../blocs/profile/profile_state.dart';
import '../../../../cubits/add_report_entity_cubit.dart';
import '../../../../widgets/custom_radio_container.dart';
import '../../../../widgets/text_button_widget.dart';
import '../../../create/input_widgets/input_textfield_widget.dart';
import '../../../create/input_widgets/pick_departament_widget.dart';
import '../../../create/input_widgets/pick_organization_widget.dart';

class QuestionnaireScreen extends StatefulWidget {
  const QuestionnaireScreen({super.key});

  @override
  State<QuestionnaireScreen> createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen>
    with DateTimeMixin {
  final prefs = sl<SharedPreferences>();
  DateTime? _selectedDate;
  final TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeForm();
  }

  void _initializeForm() {
    var isLoggedIn = context
        .read<ProfileBloc>()
        .state is ProfileDone;
    var organizationName = isLoggedIn
        ? prefs.getString('userOrganization')
        : "";
    var organizationId = isLoggedIn ? prefs.getInt('userOrganizationId') : -1;
    var fullName = isLoggedIn ? context
        .read<ProfileBloc>()
        .state
        .profileEntity
        ?.fullName : "";

    BlocProvider.of<CreateAnswerVitalRuleCubit>(context).updateInput(
      UserAnswersDtoEntity(
        organizationName: organizationName,
        organizationId: organizationId,
        fullName: fullName,
      ),
    );

    if (organizationId != null) {
      BlocProvider.of<QorgayBloc>(context).add(
          GetOrgDepartmentsEvent(organizationId));
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      BlocProvider.of<CreateAnswerVitalRuleCubit>(context).updateInput(
        UserAnswersDtoEntity(travelDate: formatDate(picked)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .sizeOf(context)
        .width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Заполнить карту'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: 'Наблюдатель'),
              OrganizationInput(prefs: prefs),
              NameInput(),
              const SizedBox(height: 10),
              DepartmentInput(),
              const SizedBox(height: 10),
              DateInput(
                selectedDate: _selectedDate,
                onSelectDate: () => _selectDate(context),
              ),
              const SizedBox(height: 20),
              const SectionTitle(title: 'Наблюдаемый'),
              ObservedCompanyInput(),
              const SizedBox(height: 10),
              ObservationPlaceInput(),
              const SizedBox(height: 10),
              ObservedTaskInput(),
              const SizedBox(height: 10),
              const CriticalMeasuresSection(),
              const SizedBox(height: 20),
              SaveButton(width: width),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    numberController.dispose();
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme
              .of(context)
              .textTheme
              .titleLarge,
        ),
        const Divider(
          height: 20,
          thickness: 1,
          color: AppColors.mainColor,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class OrganizationInput extends StatelessWidget {
  final SharedPreferences prefs;

  const OrganizationInput({required this.prefs});

  @override
  Widget build(BuildContext context) {
    var isLoggedIn = context
        .read<ProfileBloc>()
        .state is ProfileDone;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Организация',
          style: Theme
              .of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 18),
        ),
        const SizedBox(height: 10),
        PickOrganizationWidget(
          isReadOnly: isLoggedIn,
          hintText: "Организация",
          prefilledText: prefs.getString('userOrganization'),
          doesHaveContractor: false,
          changeState: ({String? organizationName, int? organizationId}) {
            BlocProvider.of<CreateAnswerVitalRuleCubit>(context).updateInput(
              UserAnswersDtoEntity(
                organizationId: organizationId,
                organizationName: organizationName,
              ),
            );
            BlocProvider.of<QorgayBloc>(context).add(
                GetOrgDepartmentsEvent(organizationId));
          },
        ),
      ],
    );
  }
}

class NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ФИО',
          style: Theme
              .of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 18),
        ),
        const SizedBox(height: 10),
        BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return TextFieldInputPage(
              isLoggedIn: state is ProfileDone,
              prefilledText: state.profileEntity?.fullName ?? "ФИО",
              hintText: 'Напишите ФИО',
              textController: TextEditingController(),
              onChanged: (value) {
                BlocProvider.of<CreateAnswerVitalRuleCubit>(context)
                    .updateInput(
                  UserAnswersDtoEntity(
                    fullName: state is ProfileDone ? state.profileEntity
                        ?.fullName : value,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class DepartmentInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAnswerVitalRuleCubit, UserAnswersDtoEntity>(
      builder: (context, state) {
        final orgId = state.organizationId;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Структурное подразделение',
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 18),
            ),
            const SizedBox(height: 10),
            PickDepartamentWidget(
              orgId: orgId,
              changeState: ({String? departamentName, int? departamentId}) {
                BlocProvider.of<CreateAnswerVitalRuleCubit>(context)
                    .updateInput(
                  UserAnswersDtoEntity(
                    structuralSubdivision: departamentName,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class DateInput extends StatelessWidget {
  final DateTime? selectedDate;
  final VoidCallback onSelectDate;

  const DateInput({required this.selectedDate, required this.onSelectDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Дата',
          style: Theme
              .of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 18),
        ),
        const SizedBox(height: 10),
        TextFormField(
          readOnly: true,
          onTap: onSelectDate,
          decoration: InputDecoration(
            hintText: 'Выберите дату',
            suffixIcon: IconButton(
              onPressed: onSelectDate,
              icon: const Icon(
                Icons.calendar_today,
                color: AppColors.mainColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.grey[100]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.grey[100]!),
            ),
          ),
          controller: TextEditingController(
            text: selectedDate != null
                ? '${selectedDate!.day.toString().padLeft(
                2, '0')}.${selectedDate!.month.toString().padLeft(
                2, '0')}.${selectedDate!.year}'
                : 'Select date',
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class ObservedCompanyInput extends StatefulWidget {
  @override
  _ObservedCompanyInputState createState() => _ObservedCompanyInputState();
}

class _ObservedCompanyInputState extends State<ObservedCompanyInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Наблюдаемая компания',
          style: Theme
              .of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 18),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            hintText: 'Введите название компании',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<CreateAnswerVitalRuleCubit>().updateInput(
                UserAnswersDtoEntity(
                    nameOfContractOrganization: value
                )
            );
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class ObservationPlaceInput extends StatefulWidget {
  @override
  _ObservationPlaceInputState createState() => _ObservationPlaceInputState();
}

class _ObservationPlaceInputState extends State<ObservationPlaceInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Место наблюдения',
          style: Theme
              .of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 18),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            hintText: 'Введите место наблюдения',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            context.read<CreateAnswerVitalRuleCubit>().updateInput(
                UserAnswersDtoEntity(
                    placeOfInspection: value
                )
            );
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class ObservedTaskInput extends StatefulWidget {
  @override
  _ObservedTaskInputState createState() => _ObservedTaskInputState();
}

class _ObservedTaskInputState extends State<ObservedTaskInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Наблюдаемое рабочее задание',
          style: Theme
              .of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: Colors.grey),
          ),
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Введите наблюдаемое рабочее задание',
              border: InputBorder.none,
            ),
            onChanged: (value) {
              context.read<CreateAnswerVitalRuleCubit>().updateInput(
                  UserAnswersDtoEntity(
                      statusOfContractOrganization: value
                  )
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class CriticalMeasuresSection extends StatelessWidget {
  const CriticalMeasuresSection();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return ColoredBox(
      color: AppColors.surveyCyanColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocProvider<VitalRulesBloc>(
          create: (context) => sl()..add(GetVitalRuleCreationPageEvent()),
          child: BlocBuilder<VitalRulesBloc, VitalRulesState>(
          builder: (context, state) {
            if (state is VitalRulesLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is VitalRulesError) {
              return const Center(child: Text('Что-то пошло не так'));
            }

            if (state is CreationPageVitalRuleDone) {
              return SingleChildScrollView(
                child: ListView.builder(
                    itemCount: state.creationPageEntity?.questions?[0].mainChildChapters.length ?? 0,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {

                      final question = state.creationPageEntity?.questions?[0].mainChildChapters[index];

                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          const SizedBox(height: 20),
                          Text(question?.secondChapterName ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          Text(question?.secondChapterTip ?? "",
                          style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const Divider(
                          height: 20, color: AppColors.mainColor, thickness: 1),
                          const SizedBox(height: 20),
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: question?.secondChapterChilds.length ?? 0,
                              separatorBuilder: (context,index) {
                                  return const SizedBox(height: 20);
                              },
                              itemBuilder: (context, index) {
                                return CustomRadioContainer(
                                  width: width,
                                  questionIndex: question!.secondChapterChilds[index].totalIndex,
                                  title: question.secondChapterChilds[index].question,
                                );
                          }
                          ),
                          ],
                      );
                    }
                    ),
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

class SaveButton extends StatelessWidget {
  final double width;

  const SaveButton({required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButtonWidget(
        textColor: Colors.white,
        color: AppColors.mainColor,
        width: width,
        height: 50.h,
        text: "Сохранить",
        onPressed: () {
          BlocProvider.of<CreateAnswerVitalRuleCubit>(context)
              .printAccumulatedData();
          BlocProvider.of<VitalRulesBloc>(context).add(SaveVitalRuleFormEvent(
              BlocProvider.of<CreateAnswerVitalRuleCubit>(context).accumulatedData
          ));

          if (context.read<VitalRulesBloc>().state is SaveVitalRulesDone) {
            SnackBarHelper.showSuccessSnackbar(message: "ЖВП сохранилось успешно");
            BlocProvider.of<CreateAnswerVitalRuleCubit>(context).clearInput();
          }
          else {
            SnackBarHelper.showErrorSnackbar(message: "Не удалось сохранить ЖВП");
          }


        },
      ),
    );
  }
}
