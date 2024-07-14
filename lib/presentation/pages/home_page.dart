import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.navigationShell
  });

  final StatefulNavigationShell navigationShell;

  final List<String> titles = const <String>[
    "Главная",
    "Мои формы",
    "Создать",
    "Уведомления",
    "Профиль",
  ];

  final List<String> icons = const <String>[
    "assets/icons/ic_nav_home.png",
    "assets/icons/ic_nav_list.png",
    "assets/icons/ic_nav_create.png",
    "assets/icons/ic_nav_notifications.png",
    "assets/icons/ic_nav_profile.png",
  ];

  @override
  Widget build(BuildContext context) {
    return BackButtonListener(
      onBackButtonPressed: () { 
        if(navigationShell.currentIndex!=0){
          navigationShell.goBranch(0);
          return Future.value(true);
        } else {
          return Future.value(false);
        }
       },
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 75,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: AppColors.gray.withOpacity(0.2)),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15)
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              navigationShell.route.branches.length, 
              (index) => Expanded(
                child: Tooltip(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  message: titles[index],
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {
                      navigationShell.goBranch(
                        index,
                        initialLocation: index == navigationShell.currentIndex,
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          icons[index],
                          height: 25,
                          color: navigationShell.currentIndex == index ? AppColors.color_blue : AppColors.light_gray,
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          titles[index],
                          maxLines: 1,
                          style: TextStyle(
                            color: navigationShell.currentIndex == index ? AppColors.color_blue : AppColors.light_gray,
                            fontSize: 11, 
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis
                          ),
                        )
                      ],
                    )
                  ) 
                ),
              )
            )
          )
        ),
        body: navigationShell
      )
    );
  }
}
