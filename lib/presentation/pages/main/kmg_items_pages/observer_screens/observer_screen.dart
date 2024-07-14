import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hsg_loyalty/presentation/blocs/profile/profile_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/profile/profile_state.dart';
import 'package:hsg_loyalty/utils/helpers/dialog_helper.dart';

import '../../../../widgets/card_item_widget.dart';

class ObserverScreen extends StatelessWidget {
  const ObserverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Наблюдения'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CardItem(
                        height: 120,
                        width: 100.w,
                        imageHeight: 50,
                        imageWidth: 50,
                        text: 'Наблюденик работ',
                        onTap: () {
                          context.push('/observerScreen/pnbWorkScreen');
                          if (state is ProfileLaunching) {
                            DialogHelper.showAlert(context);
                          }
                        },
                        heightBetweenImageAndText: 15,
                        imagePath: 'assets/images/ic_covid.png',
                        textFontSize: ScreenUtil().setSp(11),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: CardItem(
                        height: 120,
                        width: 120.w,
                        imageHeight: 50,
                        imageWidth: 50,
                        text: 'Наблюдение вождения',
                        onTap: () {
                            context.push('/observerScreen/pnbDrivingScreen');
                            if (state is ProfileLaunching) {
                              DialogHelper.showAlert(context);
                            }
                        },
                        heightBetweenImageAndText: 15,
                        imagePath: 'assets/images/ic_covid.png',
                        textFontSize: ScreenUtil().setSp(11),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CardItem(
                        height: 120,
                        width: 120.w,
                        imageHeight: 50,
                        imageWidth: 50,
                        text: 'Наблюдение работ с ЖВП',
                        onTap: () {
                          context.push('/observerScreen/pnbReportScreen');
                            if (state is ProfileLaunching) {
                              DialogHelper.showAlert(context);
                            }
                      
                        },
                        heightBetweenImageAndText: 15,
                        imagePath: 'assets/images/ic_covid.png',
                        textFontSize: ScreenUtil().setSp(11),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
