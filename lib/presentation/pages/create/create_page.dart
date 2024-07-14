import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hsg_loyalty/presentation/blocs/profile/profile_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/profile/profile_state.dart';
import 'package:hsg_loyalty/utils/helpers/dialog_helper.dart';


class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  int currentStep = 1;
  ScrollController listScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 40,
        title: Text(
          "Создать",
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: Center(
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
              ],
            ),
            TextButton(
              child: const Text('Создать форму'),
              onPressed: (){
                final profileState = context.read<ProfileBloc>().state;

                if (profileState is ProfileDone) {
                  context.push("/createPage/createFormPage");
                }
                else {
                  DialogHelper.showAlert(context);
                }
              },
            ),
          ],
        ),
      )
    );
  }
}




