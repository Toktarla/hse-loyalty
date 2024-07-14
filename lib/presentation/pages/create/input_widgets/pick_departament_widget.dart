import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/domain/entity/create/create_qorgay_entity.dart';
import 'package:hsg_loyalty/domain/entity/create/departament_entity.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_event.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_state.dart';
import 'package:hsg_loyalty/presentation/cubits/create_qorgay_cubit.dart';

import '../../../../injection_container.dart';
import '../../../../utils/constants/colors.dart';

class PickDepartamentWidget extends StatefulWidget {
  final int? orgId;
  final Function({String? departamentName, int? departamentId}) changeState;

  const PickDepartamentWidget({Key? key, this.orgId, required this.changeState}) : super(key: key);

  @override
  State<PickDepartamentWidget> createState() => _PickDepartamentWidgetState();
}

class _PickDepartamentWidgetState extends State<PickDepartamentWidget> {

  final ValueNotifier<DepartmentEntity?> selectedDepartamentNotifier = ValueNotifier<DepartmentEntity?>(null);
  final TextEditingController contractorController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController dialogController = TextEditingController();
  List<DepartmentEntity> filteredDepartaments = [];


  void _showDepartamentPickerDialog(BuildContext context,List<DepartmentEntity> departaments) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Column(
                children: [
                  TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      labelText: '',
                      suffixIcon: Icon(Icons.search),
                      suffixIconColor: AppColors.gray,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.gray)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.gray), // Color in active state
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        filteredDepartaments = departaments
                            .where((dep) =>
                                dep.nameRu!.toLowerCase().contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
              content: SingleChildScrollView(
                child: SizedBox(
                  height: 400,
                  width: 300,
                  child: ListView.builder(
                    itemCount: filteredDepartaments.isNotEmpty ? filteredDepartaments.length : departaments.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: filteredDepartaments.isNotEmpty ? Text(filteredDepartaments[index].nameRu!) : Text(departaments[index].nameRu!),
                        onTap: () {
                          filteredDepartaments.isNotEmpty
                              ?
                          setState(() {
                            selectedDepartamentNotifier.value = filteredDepartaments[index];
                            dialogController.text = selectedDepartamentNotifier.value!.nameRu!;
                          })
                              :
                          setState(() {
                            selectedDepartamentNotifier.value = departaments[index];
                            dialogController.text =
                            selectedDepartamentNotifier.value!.nameRu!;
                          });

                          widget.changeState(
                              departamentId: selectedDepartamentNotifier.value?.id ?? -1,
                              departamentName: selectedDepartamentNotifier.value?.nameRu ?? ""
                          );
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  )
                )
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    if (widget.orgId == null) {
      return const Align(
        alignment: Alignment.topLeft,
        child: Text("Сначала выберите организацию", style: TextStyle(
            color: Colors.red
        ),),
      );
    }
    else {
      return BlocBuilder<QorgayBloc, QorgayState>(

        builder: (context, state) {
          if (state is QorgayLoading) {
            dialogController.clear();
            searchController.clear();
            return const Center(child: CircularProgressIndicator(),);
          }
          if (state is QorgayError) {
            return const Center(child: Text("Что то пошло не так!"),);
          }
          if (state is DepartmentsDone && widget.orgId != null) {


            final departaments = state.departamentList;

            if (departaments!.isEmpty) {
              return Text('В выбранной вами организации не заданы подразделения',style: Theme.of(context).textTheme.bodyMedium,);
            }

            else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => _showDepartamentPickerDialog(context,departaments),
                    child: Container(
                      padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.gray),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: ValueListenableBuilder<DepartmentEntity?>(
                              valueListenable: selectedDepartamentNotifier,
                              builder: (context, value, child) {
                                return TextField(
                                  controller: dialogController,
                                  enabled: false,
                                  style: Theme.of(context).textTheme.displayMedium,
                                  decoration: InputDecoration(
                                    hintText: 'Структурное подразделение',
                                    border: InputBorder.none,
                                    hintStyle: Theme.of(context).textTheme.labelLarge,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          }


          return Container();
        },
            );
    }

  }

  @override
  void dispose() {
    super.dispose();
    selectedDepartamentNotifier.dispose();
    contractorController.dispose();
    searchController.dispose();
    dialogController.dispose();
  }
}
