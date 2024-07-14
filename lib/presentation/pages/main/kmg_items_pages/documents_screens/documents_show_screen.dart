import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hsg_loyalty/presentation/blocs/module/mobile_module_bloc.dart';

import '../../../../../injection_container.dart';
import '../../../../blocs/module/mobile_module_event.dart';
import '../../../../blocs/module/mobile_module_state.dart';
import '../../../../widgets/media_card_item.dart';

class DocumentsShowScreen extends StatelessWidget {
  final String appBarTitle;
  final int? mediaModuleId;

  const DocumentsShowScreen({
    Key? key,
    required this.appBarTitle,
    this.mediaModuleId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MobileModuleBloc>(
      create: (context) =>
          sl()..add(GetMobileModuleFilesEvent(mediaModuleId ?? 2)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
        ),
        body: BlocBuilder<MobileModuleBloc, MobileModuleState>(
          builder: (context, state) {
            if (state is MobileModuleLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is MobileModuleError) {
              return const Center(
                child: Text("Что то пошло не так!"),
              );
            }
            if (state is MobileModuleFileDone) {
              final mobileModuleFilesList = state.mobileModuleFileEntityList;
              return ListView.separated(
                itemCount: mobileModuleFilesList?.length ?? 0,
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    height: 1,
                    color: Colors.grey[350],
                    thickness: 1,
                  ),
                ), // Add a divider
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: MediaCardItem(
                      fontSize: ScreenUtil().setSp(12),
                      imageWidth: 60.w,
                      imageHeight: 60.h,
                      imagePath: 'assets/images/pdf.png',
                      text: mobileModuleFilesList![index].name,
                      link: mobileModuleFilesList[index].filePathRu,
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
