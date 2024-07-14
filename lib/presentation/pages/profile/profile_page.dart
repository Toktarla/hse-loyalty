import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hsg_loyalty/presentation/blocs/profile/profile_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/profile/profile_event.dart';
import 'package:hsg_loyalty/presentation/blocs/profile/profile_state.dart';
import 'package:hsg_loyalty/presentation/widgets/text_button_widget.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../injection_container.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prefs = sl<SharedPreferences>();

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const CircularProgressIndicator();
        }

        if (state is ProfileDone) {
          final jsonData = [
            {
              "title": "E-mail",
              "icon": Icons.email,
              'value': state.profileEntity!.email ?? "Не задано"
            },
            {
              "title": "Телефон",
              "icon": Icons.phone,
              'value': state.profileEntity!.phoneNumber ?? "Не задано"
            },
            {
              "title": "Дата рождения",
              "icon": Icons.calendar_month,
              'value': state.profileEntity!.birthDate ?? "Не задано"
            },
            {
              "title": "Skype",
              "icon": Icons.facebook,
              'value': state.profileEntity!.skype ?? "Не задано"
            }
          ];
          return Stack(
              children: [
                ListView(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 70),
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Container(
                            height: 80.h,
                            width: 80.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.gray,
                              gradient: LinearGradient(
                                  colors: [Colors.white,Colors.white,Colors.white, Colors.grey],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter
                              ),
                              image: DecorationImage(
                                  opacity: 0.4,
                                  image: AssetImage(
                                      'assets/images/img_profile_placeholder.png'
                                  )
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(state.profileEntity!.fullName ?? "Не задано",
                              style: Theme.of(context).textTheme.displayLarge)
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    ...jsonData.map((data) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data['title'].toString(),
                                style: Theme.of(context).textTheme.labelLarge),
                            Divider(
                              height: 15.h,
                              color: AppColors.gray3,
                              thickness: 1,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                    Border.all(color: AppColors.gray3, width: 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Center(
                                      child: Icon(
                                        data['icon'] as IconData,
                                        color:
                                        Theme.of(context).primaryIconTheme.color,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(data['value'] as String,
                                    style: Theme.of(context).textTheme.titleMedium),
                              ],
                            ),
                            const SizedBox(height: 25),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),

                Positioned(
                    bottom: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextButtonWidget(
                          height: 50.h,
                          width: MediaQuery.sizeOf(context).width-20,
                          text: "Выйти",
                          onPressed: () {

                            BlocProvider.of<ProfileBloc>(context).add(LogOutEvent());
                          },
                          color: AppColors.mainColor,
                          textColor: AppColors.white),
                    )
                )
              ]
          );
        }

        return Container();
      },
    );
  }
}
