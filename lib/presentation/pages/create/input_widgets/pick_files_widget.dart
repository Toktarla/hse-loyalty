import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hsg_loyalty/domain/entity/create/create_qorgay_entity.dart';
import 'package:hsg_loyalty/presentation/widgets/text_button_widget.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';
import 'package:file_picker/file_picker.dart';

import '../../../cubits/create_qorgay_cubit.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hsg_loyalty/domain/entity/create/create_qorgay_entity.dart';
import 'package:hsg_loyalty/presentation/widgets/text_button_widget.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';
import 'package:file_picker/file_picker.dart';

import '../../../cubits/create_qorgay_cubit.dart';

class PickFilesWidget extends StatelessWidget {
  final ValueNotifier<List<File>> selectedFilesNotifier;

  PickFilesWidget({Key? key})
      : selectedFilesNotifier = ValueNotifier<List<File>>([]),
        super(key: key);

  Future<void> _pickFiles(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'gif', 'png', 'txt', 'pdf', 'xls', 'doc'],
    );

    if (result != null) {
      print("result.files ${result.files}");
      print("result.files ${result.names}");

      List<File> files = result.paths.map((path) => File(path!)).toList();
      selectedFilesNotifier.value = List<File>.from(selectedFilesNotifier.value)..addAll(files);

      BlocProvider.of<CreateQorgayCubit>(context).updateInput(
        CreateQorgayEntity(files: selectedFilesNotifier.value),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Center(
      child: Column(
        children: [
          Text(
            "Доступны форматы: jpg, gif, png, txt, pdf, xls, doc",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          TextButtonWidget(
            width: width,
            height: 35.h,
            text: 'Выбрать файлы',
            onPressed: () => _pickFiles(context),
            color: const Color.fromRGBO(235, 235, 235, 1),
            textColor: AppColors.mainColor,
          ),
          const SizedBox(height: 20),
          ValueListenableBuilder<List<File>>(
            valueListenable: selectedFilesNotifier,
            builder: (context, selectedFiles, child) {
              return GridView.builder(
                shrinkWrap: true,
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
                        border: Border.all(color: Colors.grey.withOpacity(0.9), width: 1),
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
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                selectedFilesNotifier.value =
                                List<File>.from(selectedFiles)..removeAt(index);
                                BlocProvider.of<CreateQorgayCubit>(context).updateInput(
                                  CreateQorgayEntity(files: selectedFilesNotifier.value),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
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
        ],
      ),
    );
  }
}

