import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/domain/entity/create/organization_entity.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_event.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_state.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';

import '../../../../domain/entity/create/create_qorgay_entity.dart';
import '../../../../injection_container.dart';
import '../../../cubits/create_qorgay_cubit.dart';

class PickObservatedCompanyObjectWidget extends StatefulWidget {

  final TextEditingController contractorController;
  final bool showObjectTextField;
  final Function({String? supervisedObject, int? supervisedOrganizationId}) changeState;

  const PickObservatedCompanyObjectWidget({Key? key, required this.contractorController,this.showObjectTextField = true, required this.changeState}) : super(key: key);

  @override
  State<PickObservatedCompanyObjectWidget> createState() => _PickObservatedCompanyObjectWidgetState();
}

class _PickObservatedCompanyObjectWidgetState extends State<PickObservatedCompanyObjectWidget> {
  final ValueNotifier<OrganizationEntity?> selectedCompanyNotifier = ValueNotifier<OrganizationEntity?>(null);
  TextEditingController searchController = TextEditingController();
  TextEditingController dialogController = TextEditingController();
  List<OrganizationEntity> filteredCompanys = [];

  void _showcompanyPickerDialog(BuildContext context,List<OrganizationEntity> companys) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Column(
                children: [
                  // Search Bar
                  TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      labelText: '',
                      suffixIcon: Icon(Icons.search),
                      suffixIconColor: AppColors.gray,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.gray2)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.gray2),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {

                        filteredCompanys = companys.where((org) =>
                            org.name.toLowerCase().contains(value.toLowerCase()))
                            .toList();

                      });

                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
              // companys list
              content: SingleChildScrollView(
                child: SizedBox(
                  height: 400,
                  width: 300,
                  child: ListView.builder(
                    itemCount: filteredCompanys.isNotEmpty ? filteredCompanys.length : companys.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filteredCompanys.isNotEmpty ? filteredCompanys[index].name : companys[index].name),
                        onTap: () {
                          filteredCompanys.isNotEmpty
                              ?
                                setState(() {

                                  selectedCompanyNotifier.value = filteredCompanys[index];
                                  dialogController.text = selectedCompanyNotifier.value!.name;
                                })
                              :
                                setState(() {
                                  selectedCompanyNotifier.value = companys[index];
                                  dialogController.text = selectedCompanyNotifier.value!.name;
                                });
                          widget.changeState(
                              supervisedObject: selectedCompanyNotifier.value?.name ?? "",
                              supervisedOrganizationId: selectedCompanyNotifier.value?.id ?? -1
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
    return BlocProvider<QorgayBloc>(
      create: (context) => sl()..add(const GetOrganizationsEvent()),
      child: BlocBuilder<QorgayBloc, QorgayState>(
        builder: (context, state) {
          if (state is QorgayLoading) {
            return const Center(child: CircularProgressIndicator(),);
          }
          if (state is QorgayError) {
            return const Center(child: Text("Что то пошло не так!"),);
          }

          if (state is OrganizationsDone) {
            final companys = state.organizationList;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => _showcompanyPickerDialog(context,companys ?? []),
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.gray2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: ValueListenableBuilder<OrganizationEntity?>(
                            valueListenable: selectedCompanyNotifier,
                            builder: (context, value, child) {
                              return TextField(
                                controller: dialogController,
                                enabled: false,
                                style: Theme.of(context).textTheme.displayMedium,
                                decoration: InputDecoration(
                                  hintText: 'Наблюдаемая компания',
                                  hintStyle: Theme.of(context).textTheme.labelLarge,
                                  border: InputBorder.none,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                if (widget.showObjectTextField)
                  TextFormField(
                    onChanged: (value) {
                      BlocProvider.of<CreateQorgayCubit>(context).updateInput(
                          CreateQorgayEntity(
                              supervisedObject: widget.contractorController.text
                          ));
                    },
                    controller: widget.contractorController,
                    decoration: InputDecoration(
                      hintText: 'Участок/объект',
                      hintStyle: Theme.of(context).textTheme.labelLarge,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey), // Border color when enabled
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey), // Border color on focus
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey), // Default border color
                      ),
                    ),
                  )
              ],
            );
          }
          return Container();

        },
      ),
    );
  }
}
