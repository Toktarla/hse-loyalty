import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/injection_container.dart';
import 'package:hsg_loyalty/presentation/blocs/profile/profile_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/profile/profile_state.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_event.dart';
import 'package:hsg_loyalty/presentation/pages/my_forms/pnb_forms_list_page.dart';
import 'package:hsg_loyalty/presentation/pages/my_forms/qorgay_forms_list_page.dart';

class MyFormsPage extends StatelessWidget {
  const MyFormsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30),
              child: Center(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,

                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: const EdgeInsets.all(4),
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black.withOpacity(0.7),
                    tabs: const [
                      Tab(
                        text: 'Анкета',
                      ),
                      Tab(
                        text: 'ЖВП',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              // First Tab: Анкета
              QorgayFormsListPage(),
              // Second Tab: ЖВП
              PnbFormsListPage()
            ],
          ),
        ),
      ),
    );
  }
}
