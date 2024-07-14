import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/injection_container.dart';
import 'package:hsg_loyalty/presentation/blocs/profile/profile_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/profile/profile_event.dart';
import 'package:hsg_loyalty/presentation/blocs/profile/profile_state.dart';
import 'package:hsg_loyalty/presentation/widgets/rounded_text_field.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final FocusNode usernameFocusNode = FocusNode();
    final FocusNode passwordFocusNode = FocusNode();

    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileDoesNotExists) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Unknown user'),
            ),
          );
        }

        if (state is ProfileExists) {
          BlocProvider.of<ProfileBloc>(context).add(GetProfileEvent());
        }


      },
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const Text(
            'Вход в систему',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.blue,
            thickness: 1,
            height: 10,
          ),
          const SizedBox(
            height: 20,
          ),
          RoundedTextField(
            focusNode: usernameFocusNode,
            hintText: 'Логин',
            isPassword: false,
            controller: usernameController,
          ),
          const SizedBox(
            height: 10,
          ),
          RoundedTextField(
            focusNode: passwordFocusNode,

            hintText: 'Пароль',
            isPassword: true,
            controller: passwordController,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 60,
            width: double.maxFinite,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.color_blue,
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              onPressed: () async {
                ScaffoldMessenger.of(context).clearSnackBars();
                usernameFocusNode.unfocus();
                passwordFocusNode.unfocus();
                if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Заполните логин и пароль'),
                    ),
                  );
                  return;
                }

                BlocProvider.of<ProfileBloc>(context).add(LoginEvent({
                  "UserName": usernameController.text,
                  "Password": passwordController.text
                }));

              },
              child: state is ProfileLoading
                  ? const CircularProgressIndicator(color: AppColors.white,)
                  : const Text('Войти'),
            ),
          ),
        ],
        ),

        );

      },

    );
  }
}
