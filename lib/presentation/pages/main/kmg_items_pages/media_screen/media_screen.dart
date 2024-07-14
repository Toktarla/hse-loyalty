import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hsg_loyalty/presentation/blocs/module/mobile_module_bloc.dart';
import 'package:hsg_loyalty/presentation/widgets/card_item_widget.dart';

import '../../../../../injection_container.dart';
import '../../../../blocs/module/mobile_module_event.dart';
import '../../../../blocs/module/mobile_module_state.dart';

class MediaScreen extends StatelessWidget {
  final int? mobileModuleId;

  const MediaScreen({super.key, this.mobileModuleId});

  void handleNavigation(BuildContext context, Map<String, dynamic> videoData) {
    context.push("/mediaScreen/mediaOptionScreen", extra: videoData);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MobileModuleBloc>(
      create: (context) => sl()..add(const GetMobileModulesEvent()),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Медиатека'),
            centerTitle: true,
          ),
          body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocBuilder<MobileModuleBloc, MobileModuleState>(
                builder: (context, state) {
                  if (state is MobileModuleLoading) {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  if (state is MobileModuleError) {
                    return const Center(child: Text("Что то пошло не так!"),);
                  }
                  if (state is MobileModulesDone) {
                    final mobileModuleList = state.mobileModuleEntityList
                    !.where((element) => element.parentId == mobileModuleId).toList();

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(3, (index) {
                        final Map<String, dynamic> videoData = {
                          "appBarTitle": mobileModuleList[index].name!,
                          "mediaModuleId": mobileModuleList[index].id
                        };
                        return CardItem(
                          onTap: () => handleNavigation(context, videoData),
                          imagePath: 'assets/images/png.png',
                          text: mobileModuleList[index].name!,
                          imageWidth: 50.w,
                          imageHeight: 50.h,
                          heightBetweenImageAndText: 15.h,
                          textFontSize: ScreenUtil().setSp(11),
                          height: 100.h,
                          width: 100.w,
                        );
                      }),
                    );
                  }
                  return Container();
                },
              )
          )
      ),
    );
  }
}
