import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';
import 'package:hsg_loyalty/utils/helpers/ModalHelper.dart';
import '../../../injection_container.dart';
import '../../../utils/helpers/snackbar_helper.dart';
import '../../blocs/profile/profile_bloc.dart';
import '../../blocs/profile/profile_state.dart';
import '../../blocs/vitalrules/vital_rules_bloc.dart';
import '../../blocs/vitalrules/vital_rules_event.dart';
import '../../blocs/vitalrules/vital_rules_state.dart';

class PnbFormsListPage extends StatefulWidget {
  const PnbFormsListPage({super.key});

  @override
  _PnbFormsListPageState createState() => _PnbFormsListPageState();
}

class _PnbFormsListPageState extends State<PnbFormsListPage> {
  String _selectedOption = 'Выбрать';

  Future<void> _refresh(BuildContext context) async {
    if (_selectedOption == 'Мои') {
      context.read<VitalRulesBloc>().add(GetVitalRuleFormListEvent(false));
    } else if (_selectedOption == 'Все') {
      context.read<VitalRulesBloc>().add(GetVitalRuleFormListEvent(true));
    }
  }

  void _onOptionSelected(String? value) {
    setState(() {
      _selectedOption = value!;
      if (_selectedOption != 'Выбрать') {
        _refresh(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          DropdownButton<String>(
            value: _selectedOption,
            items: <String>['Выбрать', 'Мои', 'Все']
                .map((String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ))
                .toList(),
            onChanged: _onOptionSelected,
          ),
        ],
      ),
      body: BlocConsumer<VitalRulesBloc, VitalRulesState>(
        listener: (context, state) {
          if (state is VitalRuleDeleted) {
            SnackBarHelper.showSuccessSnackbar(
                message: "ЖВП был удален успешно");
            BlocProvider.of<VitalRulesBloc>(context)
                .add(GetVitalRuleFormListEvent(false));
          }
        },
        builder: (context, state) {
          if (state is VitalRulesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is VitalRulesError) {
            return const Center(child: Text('Что-то пошло не так'));
          }

          if (state is VitalRulesDone) {
            final vitalRules = state.vitalRulesEntity?.data;

            if (vitalRules == null || vitalRules.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Нет добавленных элементов",
                      style: TextStyle(
                          color: AppColors.gray,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.gray.withOpacity(0.4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        context.go("/questionnaireScreen");
                      },
                      child: FittedBox(
                        child: Text(
                          'ДОБАВИТЬ',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            vitalRules.sort((a, b) => b.id!.compareTo(a.id as num));

            return RefreshIndicator(
              onRefresh: () => _refresh(context),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: ListView.builder(
                  itemCount: vitalRules.length,
                  itemBuilder: (context, index) {
                    final rule = vitalRules[index];
                    return ListTile(
                      leading: Text(
                        rule.id.toString(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      title: Text(rule.placeOfInspection ?? ""),
                      subtitle: Text(rule.placeOfInspection ?? ""),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_outlined),
                        onPressed: () {
                          BlocProvider.of<VitalRulesBloc>(context)
                              .add(DeleteVitalRuleFormEvent(rule.id!));
                        },
                      ),
                      onTap: () {
                        ModalHelper.showDetailBottomSheetForVR(
                            context, rule.id!);
                      },
                    );
                  },
                ),
              ),
            );
          }

          return const Center(child: Text(''));
        },
      ),
    );
  }
}
