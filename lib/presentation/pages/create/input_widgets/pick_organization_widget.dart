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

class PickOrganizationWidget extends StatefulWidget {

  final TextEditingController? contractorController;
  final Function({String? organizationName, int? organizationId}) changeState;
  final bool doesHaveContractor;
  final String hintText;
  final bool isReadOnly;
  final String? prefilledText;

  const PickOrganizationWidget({Key? key, this.contractorController, required this.changeState, this.doesHaveContractor = true, required this.hintText, required this.isReadOnly, this.prefilledText}) : super(key: key);

  @override
  State<PickOrganizationWidget> createState() => _PickOrganizationWidgetState();
}

class _PickOrganizationWidgetState extends State<PickOrganizationWidget> {
  final ValueNotifier<OrganizationEntity?> selectedOrganizationNotifier = ValueNotifier<OrganizationEntity?>(null);
  TextEditingController searchController = TextEditingController();
  TextEditingController dialogController = TextEditingController();
  List<OrganizationEntity> filteredOrganizations = [];


  void _showOrganizationPickerDialog(BuildContext context,List<OrganizationEntity> organizations) {
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

                        filteredOrganizations = organizations.where((org) =>
                                org.name.toLowerCase().contains(value.toLowerCase()))
                            .toList();

                      });

                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
              // Organizations list
              content: SingleChildScrollView(
                child: SizedBox(
                  height: 400,
                  width: 300,
                  child: ListView.builder(
                          itemCount: filteredOrganizations.isNotEmpty ? filteredOrganizations.length : organizations.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(filteredOrganizations.isNotEmpty ? filteredOrganizations[index].name : organizations[index].name),
                              onTap: () {
                                filteredOrganizations.isNotEmpty
                                    ?
                                      setState(() {
                                        selectedOrganizationNotifier.value =
                                        filteredOrganizations[index];
                                        dialogController.text =
                                            selectedOrganizationNotifier.value!.name;
                                      })
                                    :
                                      setState(() {
                                        selectedOrganizationNotifier.value =
                                        organizations[index];
                                        dialogController.text =
                                            selectedOrganizationNotifier.value!.name;
                                      });

                                widget.changeState(
                                  organizationName: selectedOrganizationNotifier.value?.name ?? "",
                                  organizationId: selectedOrganizationNotifier.value?.id ?? -1
                                );

                                Navigator.of(context).pop();
                              },
                            );
                          },
                        )
                ),
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
          final organizations = state.organizationList;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  if(!widget.isReadOnly) _showOrganizationPickerDialog(context,organizations ?? []);
                },
                child: ValueListenableBuilder<OrganizationEntity?>(
                  valueListenable: selectedOrganizationNotifier,
                  builder: (context, value, child) {
                    return TextField(
                      controller: dialogController,
                      enabled: false,
                      readOnly: widget.isReadOnly,
                      style: Theme.of(context).textTheme.displayLarge,
                      decoration: InputDecoration(
                        hintText: widget.isReadOnly ? widget.prefilledText : widget.hintText,
                        hintStyle: Theme.of(context).textTheme.displayLarge,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: const BorderSide(color: AppColors.textFieldBorderColor),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey), // Border color on focus
                        ),
                        filled: widget.isReadOnly,
                        fillColor: widget.isReadOnly ? AppColors.textFieldFillColor : AppColors.transparent,

                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              if (widget.doesHaveContractor)
                ValueListenableBuilder(
                    valueListenable: selectedOrganizationNotifier,
                    builder: (context, value, child) {
                      if (value != null) {
                        return TextFormField(
                          onChanged: (value) {
                            BlocProvider.of<CreateQorgayCubit>(context).updateInput(CreateQorgayEntity(
                                contractor: widget.contractorController?.text ?? "",
                                isContractor: true
                            ));
                          },
                          controller: widget.contractorController,
                          decoration: InputDecoration(
                            hintText: 'Подрядчик',
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
                        );
                      }
                      return Container();
                    })
            ],
          );
        }
        return Container();

      },
    ),
);
  }
}
