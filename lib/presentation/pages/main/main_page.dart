import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hsg_loyalty/presentation/widgets/menu_item_widget.dart';
import 'package:hsg_loyalty/utils/helpers/dialog_helper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/entity/module/mobile_module_entity.dart';
import '../../../utils/constants/constants.dart';
import '../../blocs/module/mobile_module_bloc.dart';
import '../../blocs/module/mobile_module_state.dart';
import '../../blocs/profile/profile_bloc.dart';
import '../../blocs/profile/profile_state.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  Future<void> handleTap(int index, int? mobileModuleId) async {
    final profileState = context.read<ProfileBloc>().state;

    switch (index) {
      case 0:
        context.go("/createPage");
        break;
      case 1:
        context.push("/observerScreen");
        break;
      case 2:
        context.push("/surveyScreen");
        break;
      case 3:
        context.push("/mediaScreen", extra: mobileModuleId);
        break;
      case 4:
        context.push("/documentsScreen", extra: mobileModuleId);
        break;
      case 5:
        context.push("/incidentReviewScreen", extra: mobileModuleId);
        break;
      case 6:
        context.push("/visualAidsScreen", extra: mobileModuleId);
        break;
      case 7:
        context.push("/callScreen");
        break;
      case 8:
        await launchUrl(Uri.parse(hseLearningSite));
        break;
      case 9:
        if (profileState is ProfileDone) {
          context.push("/questionnaireScreen");
        } else {
          DialogHelper.showAlert(context);
        }
        break;
      case 10:
        if (profileState is ProfileDone) {
          context.push("/visitReportScreen");
        }
        else {
          DialogHelper.showAlert(context);
        }
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 40,
          title: Text(
            "Главная",
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        body: BlocBuilder<MobileModuleBloc, MobileModuleState>(
          builder: (context, mobileModuleState) {
            if (mobileModuleState is MobileModuleLoading) {
              return const Center(child: CircularProgressIndicator(),);
            }
            if (mobileModuleState is MobileModuleError) {
              return const Center(child: Text("Что-то пошло не так!"),);
            }
            if (mobileModuleState is MobileModulesDone) {
              final mobileModuleList = mobileModuleState.mobileModuleEntityList!
                  .where((element) => element.parentId == null)
                  .toList();


              // Hard coded 2 menu items
              mobileModuleList.addAll([
                const MobileModuleEntity(
                  id: 100,
                  name: "Анкета ЖВП",
                  parentId: null,
                  code: '',
                  type: null,
                  ord: null,
                  url: '',
                ),
                const MobileModuleEntity(
                  id: 101,
                  name: "Ответ о визите",
                  parentId: null,
                  code: '',
                  type: null,
                  ord: null,
                  url: '',
                ),
              ]);

              return SafeArea(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/app_icons/ic_launcher_qorgay-playstore.png",
                            height: 65,
                          ),
                          const Text(
                            'HSE KMG',
                            style: TextStyle(fontSize: 32, color: Color.fromARGB(255, 35, 18, 94)),
                          ),
                          const SizedBox(width: 25,)
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, profileState) {
                          return Expanded(
                            child: ListView(
                              physics: const ClampingScrollPhysics(),
                              children: List.generate((mobileModuleList.length / 3).ceil(),
                                      (rowIndex) => Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: IntrinsicHeight(
                                      child: Row(
                                        children: List.generate(
                                            3, (colIndex) {
                                          final int index = 3 * rowIndex + colIndex;
                                          if (index < mobileModuleList.length) {
                                            return Expanded(
                                              child: MenuItem(
                                                imageHeight: 50,
                                                imageWidth: 50,
                                                text: mobileModuleList[index].name!,
                                                onTap: () {
                                                  handleTap(index, mobileModuleList[index].id);
                                                  if (profileState is ProfileLaunching &&
                                                      (index == 11 || index == 10)) {
                                                    DialogHelper.showAlert(context);
                                                  }
                                                },
                                                heightBetweenImageAndText: 12,
                                                imagePath: 'assets/images/${imagePaths[index]}',
                                                textFontSize: 14,
                                              ),
                                            );
                                          } else {
                                            return const Spacer();
                                          }
                                        }
                                        ),
                                      ),
                                    ),
                                  )
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        )
    );
  }
}
