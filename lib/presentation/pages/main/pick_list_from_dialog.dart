import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';

class PickDataListFromDialog<T> extends StatefulWidget {
  final TextEditingController? contractorController;
  final bool showSecondTextField;
  final List<T> listData;
  final String firstTextFieldHintText;
  final Function({dynamic firstArgument, dynamic secondArgument}) changeState;
  final Function({String? secondTextFieldText})? secondTextFieldState;
  final String? secondTextFieldHintText;
  final String Function(T item) getItemName; // Callback to get the item name

  const PickDataListFromDialog({
    Key? key,
    this.contractorController,
    this.showSecondTextField = true,
    required this.changeState,
    this.secondTextFieldState,
    required this.listData,
    this.secondTextFieldHintText = "",
    required this.firstTextFieldHintText,
    required this.getItemName, // Initialize the callback
  }) : super(key: key);

  @override
  State<PickDataListFromDialog<T>> createState() => _PickDataListFromDialogState<T>();
}

class _PickDataListFromDialogState<T> extends State<PickDataListFromDialog<T>> {
  final ValueNotifier<T?> selectedDataNotifier = ValueNotifier<T?>(null);
  TextEditingController searchController = TextEditingController();
  TextEditingController dialogController = TextEditingController();
  List<T> filteredDataList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
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
                                filteredDataList = widget.listData
                                    .where((data) =>
                                    widget.getItemName(data).toLowerCase().contains(value.toLowerCase()))
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
                            itemCount: filteredDataList.isNotEmpty ? filteredDataList.length : widget.listData.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(filteredDataList.isNotEmpty
                                    ? widget.getItemName(filteredDataList[index])
                                    : widget.getItemName(widget.listData[index])),
                                onTap: () {
                                  setState(() {
                                    selectedDataNotifier.value = filteredDataList.isNotEmpty
                                        ? filteredDataList[index]
                                        : widget.listData[index];
                                    dialogController.text = widget.getItemName(selectedDataNotifier.value!);
                                  });
                                  widget.changeState(
                                    firstArgument: widget.getItemName(selectedDataNotifier.value!),
                                    secondArgument: selectedDataNotifier.value.hashCode,
                                  );
                                  Navigator.of(context).pop();
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.gray2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Expanded(
                  child: ValueListenableBuilder<T?>(
                    valueListenable: selectedDataNotifier,
                    builder: (context, value, child) {
                      return TextField(
                        controller: dialogController,
                        enabled: false,
                        style: Theme.of(context).textTheme.displayMedium,
                        decoration: InputDecoration(
                          hintText: widget.firstTextFieldHintText,
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
        if (widget.showSecondTextField)
          TextFormField(
            onChanged: (value) {
              widget.secondTextFieldState?.call();
            },
            controller: widget.contractorController,
            decoration: InputDecoration(
              hintText: widget.secondTextFieldHintText,
              hintStyle: Theme.of(context).textTheme.labelLarge,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey), // Border color when enabled
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey), // Border color on focus
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey), // Default border color
              ),
            ),
          ),
      ],
    );
  }
}
