import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hsg_loyalty/domain/entity/departure-report/departure_report_entity.dart';
import 'package:hsg_loyalty/injection_container.dart';
import 'package:hsg_loyalty/presentation/blocs/departure-report/departure_report_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/departure-report/departure_report_event.dart';
import 'package:hsg_loyalty/presentation/blocs/departure-report/departure_report_state.dart';
import 'package:hsg_loyalty/presentation/cubits/add_report_entity_cubit.dart';
import 'package:hsg_loyalty/presentation/widgets/text_button_widget.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';
import 'package:hsg_loyalty/utils/helpers/snackbar_helper.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../blocs/profile/profile_bloc.dart';
import '../../../../blocs/profile/profile_state.dart';

class AddReportScreen extends StatefulWidget {
  const AddReportScreen({Key? key}) : super(key: key);

  @override
  _AddReportScreenState createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  final SharedPreferences _prefs = sl<SharedPreferences>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _fioController = TextEditingController();
  final TextEditingController _temaVizitaController = TextEditingController();
  final TextEditingController _mestoProvedeniyaController =
  TextEditingController();
  final TextEditingController _kolichestvoUchastnikovController = TextEditingController();
  final TextEditingController _obsuzhdennyeVoprosyController = TextEditingController();
  final TextEditingController _prinyatyeResheniyaController = TextEditingController();
  final ValueNotifier<List<File>> selectedFilesNotifier = ValueNotifier<List<File>>([]);

  Future<void> _pickFiles(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'gif', 'png', 'txt', 'pdf', 'xls', 'doc'],
    );

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      selectedFilesNotifier.value = List<File>.from(selectedFilesNotifier.value)
        ..addAll(files);

      BlocProvider.of<AddReportEntityCubit>(context).updateInput(
          DepartureReportEntity(file: selectedFilesNotifier.value));
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      print(picked);
      setState(() {
        _dateController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
      BlocProvider.of<AddReportEntityCubit>(context).updateInput(
          DepartureReportEntity(departureDate: _dateController.text));
    }
  }

  void _validateFields() {
    if (
        _dateController.text.isEmpty ||
        _temaVizitaController.text.isEmpty ||
        _mestoProvedeniyaController.text.isEmpty ||
        _kolichestvoUchastnikovController.text.isEmpty ||
        _obsuzhdennyeVoprosyController.text.isEmpty ||
        _prinyatyeResheniyaController.text.isEmpty) {
      throw Exception('Пожалуйста, заполните все обязательные поля');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Отчет'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: SingleChildScrollView(
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Ответ о визите',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Text(
                    'ФИО',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextField(
                    enableSuggestions: true,
                    controller: _fioController,
                    onChanged: (value) {
                      BlocProvider.of<AddReportEntityCubit>(context)
                          .updateInput(DepartureReportEntity(
                          authorFullName: value));
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: state.profileEntity?.fullName ?? "ФИО",
                      hintStyle: Theme.of(context).textTheme.labelLarge,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(
                            color: AppColors.textFieldBorderColor),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey), // Border color on focus
                      ),
                      filled: true,
                      fillColor: AppColors.textFieldFillColor,
                    ),
                    style: Theme.of(context).textTheme.displayLarge,
                    autocorrect: true,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Дата отчета',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextField(
                    controller: _dateController,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.calendar_today,
                          color: AppColors.mainColor,
                        ),
                        onPressed: () => _selectDate(context),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Тема Визита',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextField(
                    controller: _temaVizitaController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      BlocProvider.of<AddReportEntityCubit>(context)
                          .updateInput(DepartureReportEntity(topic: value));
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Протокол',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextButtonWidget(
                    width: MediaQuery.sizeOf(context).width,
                    height: 45.h,
                    text: "Выбрать файлы",
                    onPressed: () => _pickFiles(context),
                    color: const Color.fromRGBO(235, 235, 235, 1),
                    textColor: AppColors.mainColor,
                  ),
                  const SizedBox(height: 10),
                  ValueListenableBuilder<List<File>>(
                    valueListenable: selectedFilesNotifier,
                    builder: (context, selectedFiles, child) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 16 / 9,
                            crossAxisSpacing: 50,
                            mainAxisSpacing: 40),
                        itemCount: selectedFiles.length,
                        itemBuilder: (BuildContext context, int index) {
                          File file = selectedFiles[index];
                          bool isImage = file.path.endsWith('.jpg') ||
                              file.path.endsWith('.png') ||
                              file.path.endsWith('.gif');

                          return AspectRatio(
                            aspectRatio: 4 / 3,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.9),
                                    width: 1),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (isImage)
                                    Image.file(
                                      file,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    )
                                  else
                                    Center(
                                      child: Text(
                                        file.path.split('/').last,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        selectedFilesNotifier.value =
                                        List<File>.from(selectedFiles)
                                          ..removeAt(index);

                                        BlocProvider.of<AddReportEntityCubit>(
                                            context)
                                            .updateInput(DepartureReportEntity(
                                            file: selectedFilesNotifier
                                                .value));
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.white,
                                        ),
                                        child: const Icon(
                                          Icons.close,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Место проведения',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextField(
                    controller: _mestoProvedeniyaController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      BlocProvider.of<AddReportEntityCubit>(context)
                          .updateInput(DepartureReportEntity(place: value));
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Количество участников',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextField(
                      controller: _kolichestvoUchastnikovController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        int? peopleCount = int.tryParse(value);
                        if (peopleCount != null) {
                          BlocProvider.of<AddReportEntityCubit>(context).updateInput(
                            DepartureReportEntity(
                              peopleCount: peopleCount,
                            ),
                          );
                        }
                      }),
                  const SizedBox(height: 10),
                  Text(
                    'Обсужденные вопросы',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextField(
                    controller: _obsuzhdennyeVoprosyController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      BlocProvider.of<AddReportEntityCubit>(context).updateInput(DepartureReportEntity(questions: value));
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Принятые решения',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextField(
                    controller: _prinyatyeResheniyaController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      BlocProvider.of<AddReportEntityCubit>(context).updateInput(DepartureReportEntity(decisions: value));
                    },
                  ),
                  const SizedBox(height: 20),
                  TextButtonWidget(
                    width: MediaQuery.sizeOf(context).width,
                    height: 45.h,
                    text: "Сохранить",
                    onPressed: () {
                      try {
                        _validateFields();
                        if (state is ProfileDone) {
                          BlocProvider.of<AddReportEntityCubit>(context)
                              .updateInput(DepartureReportEntity(
                              authorFullName: state.profileEntity?.fullName ?? "ФИО",
                              userId: state.profileEntity?.id ?? -1,
                              companyId: _prefs.getInt('userOrganizationId') ?? -1));
                        } else {
                          context.push("/authPage");
                        }
                        BlocProvider.of<DepartureReportBloc>(context).add(SaveDepartureReportEvent(BlocProvider.of<AddReportEntityCubit>(context)
                                    .accumulatedData));
                        if (BlocProvider.of<DepartureReportBloc>(context).state is SaveDepartureReportDone) {
                          SnackBarHelper.showSuccessSnackbar(
                              message: "Отчет был сохранен");
                          BlocProvider.of<AddReportEntityCubit>(context)
                              .clearInput();
                          context.go('/');
                        } else {
                          SnackBarHelper.showErrorSnackbar(
                              message: "Не удалось сохранить отчет");
                        }
                      } catch (e) {
                        SnackBarHelper.showErrorSnackbar(
                            message: e.toString());
                      }
                    },
                    color: const Color.fromRGBO(235, 235, 235, 1),
                    textColor: AppColors.mainColor,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _fioController.dispose();
    _dateController.dispose();
    _temaVizitaController.dispose();
    _mestoProvedeniyaController.dispose();
    _kolichestvoUchastnikovController.dispose();
    _obsuzhdennyeVoprosyController.dispose();
    _prinyatyeResheniyaController.dispose();
  }
}
