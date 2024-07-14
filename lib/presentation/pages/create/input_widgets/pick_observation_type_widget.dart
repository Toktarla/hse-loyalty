import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/domain/entity/create/observation_type_entity.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_event.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_state.dart';
import 'package:hsg_loyalty/domain/entity/create/create_qorgay_entity.dart';
import 'package:hsg_loyalty/injection_container.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';

import '../../../cubits/create_qorgay_cubit.dart';

class PickObservationTypeWidget extends StatefulWidget {
  final TextEditingController typeController;
  const PickObservationTypeWidget({Key? key, required this.typeController}) : super(key: key);

  @override
  State<PickObservationTypeWidget> createState() => _PickObservationTypeWidgetState();
}

class _PickObservationTypeWidgetState extends State<PickObservationTypeWidget> {
  final ValueNotifier<ObservationTypeEntity?> selectedOptionForForm1 = ValueNotifier<ObservationTypeEntity?>(null);
  final TextEditingController searchController = TextEditingController();
  List<ObservationTypeEntity> filteredOptions = [];

  @override
  void initState() {
    super.initState();
    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    widget.typeController.dispose();
    selectedOptionForForm1.dispose();
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      filteredOptions = filteredOptions
          .where((option) =>
          option.name.toLowerCase().contains(searchController.text.toLowerCase()))
          .toList();
    });
  }

  void _showObservationTypePickerDialog(BuildContext context, List<ObservationTypeEntity> options) {

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
                      labelText: 'Поиск',
                      suffixIcon: Icon(Icons.search),
                      suffixIconColor: AppColors.gray,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.gray),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.gray),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        filteredOptions = options.where((org) =>
                            org.name.toLowerCase().contains(value.toLowerCase()))
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
                    child: filteredOptions.isNotEmpty
                        ? ListView.builder(
                      itemCount: filteredOptions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(filteredOptions[index].name),
                          onTap: () {
                            setState((){
                              selectedOptionForForm1.value = filteredOptions[index];
                              widget.typeController.text = filteredOptions[index].name;
                              Navigator.of(context).pop();
                            });
                            BlocProvider.of<CreateQorgayCubit>(context).updateInput(
                                CreateQorgayEntity(
                                    dictKorgauObservationTypeId: selectedOptionForForm1.value?.id ?? -1
                                )
                            );
                          },
                        );
                      },
                    )
                        :
                    ListView.builder(
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(options[index].name),
                          onTap: () {
                            setState((){
                              selectedOptionForForm1.value = options[index];
                              widget.typeController.text = options[index].name;
                              Navigator.of(context).pop();
                            });
                            BlocProvider.of<CreateQorgayCubit>(context).updateInput(
                                CreateQorgayEntity(
                                    dictKorgauObservationTypeId: selectedOptionForForm1.value?.id ?? -1
                                )
                            );
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
      create: (context) => sl()..add(const GetObservationTypesEvent()),
      child: BlocBuilder<QorgayBloc, QorgayState>(
        builder: (context, state) {
          if (state is QorgayLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is QorgayError) {
            return const Center(child: Text("Something went wrong!"));
          }

          if (state is ObservationTypesDone) {
            final options = state.observationTypeEntityList;

            return InkWell(
              onTap: () => _showObservationTypePickerDialog(context, options ?? []),
              child: AbsorbPointer(
                child: TextFormField(
                  controller: widget.typeController,
                  decoration: const InputDecoration(
                    hintText: 'Выбрать...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}