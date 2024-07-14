import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hsg_loyalty/presentation/blocs/departure-report/departure_report_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/module/mobile_module_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/module/mobile_module_event.dart';
import 'package:hsg_loyalty/presentation/blocs/profile/profile_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/profile/profile_event.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/vitalrules/vital_rules_bloc.dart';
import 'package:hsg_loyalty/presentation/cubits/add_report_entity_cubit.dart';
import 'package:hsg_loyalty/presentation/cubits/bottom_bar_navigation_cubit.dart';
import 'package:hsg_loyalty/presentation/cubits/create_answer_vital_rule_cubit.dart';
import 'package:hsg_loyalty/presentation/cubits/create_qorgay_cubit.dart';
import 'package:hsg_loyalty/presentation/cubits/pnb_observation_cubit.dart';
import 'package:hsg_loyalty/utils/helpers/snackbar_helper.dart';
import 'config/route/routes.dart';
import 'config/theme/theme.dart';
import 'injection_container.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  HttpOverrides.global = MyHttpOverrides();

  // runApp(const MyApp());
  runApp(DevicePreview(
    builder: (context) => const MyApp(),
    enabled: !kReleaseMode,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomBarNavigationCubit>(
          create: (_) => sl(),
        ),
        BlocProvider<ProfileBloc>(
            create: (_) => sl()..add(GetProfileEvent())
        ),
        BlocProvider<MobileModuleBloc>(
            create: (_) => sl()..add(const GetMobileModulesEvent())
        ),
        BlocProvider<QorgayBloc>(
            create: (_) => sl(),
        ),
        BlocProvider<VitalRulesBloc>(
          create: (_) => sl(),
        ),
        BlocProvider<DepartureReportBloc>(
          create: (_) => sl(),
        ),
        BlocProvider<CreateQorgayCubit>(
            create: (_) => sl(),
        ),
        BlocProvider<AddReportEntityCubit>(
          create: (_) => sl(),
        ),
        BlocProvider<CreateAnswerVitalRuleCubit>(
          create: (_) => sl(),
        ),
        BlocProvider<PnbObservationCubitinit>(
          create: (_) => sl(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (_,child) => MaterialApp.router(
          routerConfig: router,
          scaffoldMessengerKey: SnackBarHelper.scaffoldMessengerKey,
          debugShowCheckedModeBanner: false,
          title: 'HSE KMG',
          theme: theme,
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)), child: widget!,
            );
          },
        ),
      ),
    );
  }
}


