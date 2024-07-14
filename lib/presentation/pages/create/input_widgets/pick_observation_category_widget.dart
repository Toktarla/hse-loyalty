import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hsg_loyalty/domain/entity/create/create_qorgay_entity.dart';
import 'package:hsg_loyalty/injection_container.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_event.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_state.dart';
import 'package:hsg_loyalty/presentation/cubits/create_qorgay_cubit.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';

class PickObservationCategoryWidget extends StatefulWidget {
  const PickObservationCategoryWidget({Key? key}) : super(key: key);

  @override
  _PickObservationCategoryWidgetState createState() => _PickObservationCategoryWidgetState();
}

class _PickObservationCategoryWidgetState extends State<PickObservationCategoryWidget> {
  List<int> selectedCategoryIds = [];
  List<String> selectedCategoryNames = [];

  void _showCheckBoxDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider<QorgayBloc>(
          create: (context) => sl()..add(const GetObservationCategoriesEvent()),
          child: CheckBoxDialog(
            onSelectedCategoriesChanged: (ids, names) {
              setState(() {
                selectedCategoryIds = ids;
                selectedCategoryNames = names;
              });
              BlocProvider.of<CreateQorgayCubit>(context).updateInput(
                CreateQorgayEntity(dictKorgauObservationCategories: selectedCategoryIds),
              );
            },
            initialSelectedCategoryIds: selectedCategoryIds,
            initialSelectedCategoryNames: selectedCategoryNames,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _showCheckBoxDialog,
          child: const AbsorbPointer(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Выбрать...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        selectedCategoryNames.isNotEmpty
            ? GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
                      ),
                      itemCount: selectedCategoryNames.length,
                      itemBuilder: (context, index) {
            final categoryName = selectedCategoryNames[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.withOpacity(0.9), width: 1),
              ),
              child: Center(
                child: Text(
                  categoryName,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            );
                      },
                    )
            : Container(),
      ],
    );
  }
}

class CheckBoxDialog extends StatefulWidget {
  final Function(List<int>, List<String>) onSelectedCategoriesChanged;
  final List<int> initialSelectedCategoryIds;
  final List<String> initialSelectedCategoryNames;

  const CheckBoxDialog({
    Key? key,
    required this.onSelectedCategoriesChanged,
    required this.initialSelectedCategoryIds,
    required this.initialSelectedCategoryNames,
  }) : super(key: key);

  @override
  _CheckBoxDialogState createState() => _CheckBoxDialogState();
}

class _CheckBoxDialogState extends State<CheckBoxDialog> {
  late List<int> selectedCategoryIds;
  late List<String> selectedCategoryNames;

  @override
  void initState() {
    super.initState();
    selectedCategoryIds = List.from(widget.initialSelectedCategoryIds);
    selectedCategoryNames = List.from(widget.initialSelectedCategoryNames);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Выбрать...'),
      content: SizedBox(
        width: double.maxFinite,
        child: CheckBoxInputPage(
          selectedCategoryIds: selectedCategoryIds,
          selectedCategoryNames: selectedCategoryNames,
          onCategorySelected: (id, name, isSelected) {
            setState(() {
              if (isSelected) {
                if (!selectedCategoryIds.contains(id)) {
                  selectedCategoryIds.add(id);
                  selectedCategoryNames.add(name);
                }
              } else {
                selectedCategoryIds.remove(id);
                selectedCategoryNames.remove(name);
              }
            });
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Закрыть'),
        ),
        TextButton(
          onPressed: () {
            widget.onSelectedCategoriesChanged(selectedCategoryIds, selectedCategoryNames);
            Navigator.of(context).pop();
          },
          child: const Text('Создать'),
        ),
      ],
    );
  }
}

class CheckBoxInputPage extends StatelessWidget {
  final List<int> selectedCategoryIds;
  final List<String> selectedCategoryNames;
  final Function(int, String, bool) onCategorySelected;

  const CheckBoxInputPage({
    Key? key,
    required this.selectedCategoryIds,
    required this.selectedCategoryNames,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QorgayBloc, QorgayState>(
      builder: (context, state) {
        if (state is QorgayLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is QorgayError) {
          return const Center(
            child: Text("Что-то пошло не так!"),
          );
        }
        if (state is ObservationCategoriesDone) {
          final observationCategories = state.observationCategoryEntityList;
          final checkboxStates = List<bool>.generate(
            observationCategories?.length ?? 0,
                (index) => selectedCategoryIds.contains(observationCategories![index].id),
          );

          return ListView.separated(
            shrinkWrap: true,
            itemCount: observationCategories?.length ?? 0,
            separatorBuilder: (context, index) => SizedBox(height: 5.h),
            itemBuilder: (context, index) {
              final category = observationCategories![index];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      value: checkboxStates[index],
                      onChanged: (newValue) {
                        final isSelected = newValue ?? false;
                        onCategorySelected(category.id, category.name, isSelected);
                      },
                      activeColor: AppColors.mainColor,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: Text(
                      category.name,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ],
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
