import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hsg_loyalty/presentation/blocs/module/mobile_module_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/module/mobile_module_state.dart';

import '../../../../../injection_container.dart';
import '../../../../blocs/module/mobile_module_event.dart';
import '../../../../widgets/media_card_item.dart';


class VisualAidsScreen extends StatelessWidget {
  final int? mobileModuleId;

  const VisualAidsScreen({super.key, this.mobileModuleId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MobileModuleBloc>(
      create: (context) =>
      sl()
        ..add(GetMobileModuleFilesEvent(mobileModuleId ?? 11)),

      child: Scaffold(
        appBar: AppBar(
          title: const Text('Наглядные пособия'),
          centerTitle: true,

        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: BlocBuilder<MobileModuleBloc, MobileModuleState>(
            builder: (context, state) {
              if (state is MobileModuleLoading) {
                return const Center(child: CircularProgressIndicator(),);
              }
              if (state is MobileModuleError) {
                return const Center(child: Text("Что то пошло не так!"),);
              }
              if (state is MobileModuleFileDone) {
                final mobileModuleFilesList = state.mobileModuleFileEntityList;

                return ListView.separated(
                  itemCount: mobileModuleFilesList?.length ?? 20,
                  separatorBuilder: (context, index) =>
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                            height: 1, color: Colors.grey[400], thickness: 1),
                      ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: MediaCardItem(
                        fontSize: ScreenUtil().setSp(13),
                        imageWidth: 50.w,
                        imageHeight: 50.h,
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
      ),
    );
  }
}