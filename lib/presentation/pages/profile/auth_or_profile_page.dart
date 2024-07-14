import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/presentation/pages/profile/profile_page.dart';

import '../../blocs/profile/profile_bloc.dart';
import '../../blocs/profile/profile_state.dart';
import 'auth_page.dart';



class AuthOrProfilePage extends StatelessWidget {
  const AuthOrProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 40,
        title: Text(
          "Профиль",
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: BlocBuilder<ProfileBloc,ProfileState>(
        builder: (context,state) {
          if (state is ProfileDone) {
            return const ProfilePage();
          }
          else {
            return const AuthPage();
          }
        },
      )
    );
  }
}
