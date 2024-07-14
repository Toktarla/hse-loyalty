import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hsg_loyalty/data/data_source/remote/departure-report/departure_report_api.dart';
import 'package:hsg_loyalty/data/data_source/remote/guestionnaires/questionnaire_api.dart';
import 'package:hsg_loyalty/data/data_source/remote/module/mobile_module_api.dart';
import 'package:hsg_loyalty/data/data_source/remote/profile/profile_api.dart';
import 'package:hsg_loyalty/data/data_source/remote/vitalrules/vital_rules_api.dart';
import 'package:hsg_loyalty/data/repository/departure_report_repository_impl.dart';
import 'package:hsg_loyalty/data/repository/mobile_module_repository_impl.dart';
import 'package:hsg_loyalty/domain/repository/departure_report_repository.dart';
import 'package:hsg_loyalty/domain/repository/mobile_module_repository.dart';
import 'package:hsg_loyalty/domain/repository/profile_repository.dart';
import 'package:hsg_loyalty/domain/repository/qorgay_repository.dart';
import 'package:hsg_loyalty/domain/repository/questionnaire_repository.dart';
import 'package:hsg_loyalty/domain/repository/vital_rules_repository.dart';
import 'package:hsg_loyalty/domain/usecase/departure-report/delete_departure_report_form_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/departure-report/get_departure_report_form_list_for_user_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/departure-report/get_departure_report_form_list_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/departure-report/get_departure_report_form_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/departure-report/save_departure_report_form_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/module/get_mobile_module_file_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/module/get_mobile_modules_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/qorgay/add_qorgay_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/qorgay/get_departaments_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/qorgay/get_observation_categories_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/qorgay/get_observation_types_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/qorgay/get_organizations_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/qorgay/get_qorgay_list_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/qorgay/get_qorgays_by_userid_usercase.dart';
import 'package:hsg_loyalty/domain/usecase/questionnaires/get_questionnaire_byId_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/questionnaires/get_questionnaires_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/questionnaires/save_questionnaire_answer_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/user/get_profile_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/user/login_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/vitalrules/delete_vital_rule_form_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/vitalrules/get_vital_rule_creation_page_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/vitalrules/get_vital_rule_form_list_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/vitalrules/get_vital_rule_form_usecase.dart';
import 'package:hsg_loyalty/domain/usecase/vitalrules/save_vital_rule_form_usecase.dart';
import 'package:hsg_loyalty/presentation/blocs/departure-report/departure_report_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/module/mobile_module_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/place/place_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/pnb/pnb-work/pnb_work_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/profile/profile_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/qorgay/qorgay_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/questionnaire/questionnaire_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/vitalrules/vital_rules_bloc.dart';
import 'package:hsg_loyalty/presentation/cubits/add_report_entity_cubit.dart';
import 'package:hsg_loyalty/presentation/cubits/bottom_bar_navigation_cubit.dart';
import 'package:hsg_loyalty/presentation/cubits/create_answer_vital_rule_cubit.dart';
import 'package:hsg_loyalty/presentation/cubits/create_qorgay_cubit.dart';
import 'package:hsg_loyalty/presentation/cubits/pnb_observation_cubit.dart';
import 'package:hsg_loyalty/utils/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/data_source/remote/qorgay/qorgay_api.dart';
import 'data/repository/profile_repository_impl.dart';
import 'data/repository/qorgay_repository_impl.dart';
import 'data/repository/questionnaire_repository_impl.dart';
import 'data/repository/vital_rules_repository_impl.dart';

final sl = GetIt.instance;
final baseOptions = BaseOptions(
  baseUrl: baseUrl,
  contentType: Headers.jsonContentType,
  validateStatus: (int? status) {
    return status != null;
    // return status != null && status >= 200 && status < 300;
  },
);

class ErrorInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final status = response.statusCode;
    final isValid = status != null && status >= 200 && status < 300;
    if (!isValid) {
      throw DioException.badResponse(
        statusCode: status!,
        requestOptions: response.requestOptions,
        response: response,
      );
    }
    super.onResponse(response, handler);
  }
}

Future<void> initializeDependencies() async {
  // Dependencies
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(prefs);
  sl.registerSingleton<Dio>(Dio(baseOptions));

  // Repository, API
  sl.registerSingleton<ProfileApi>(ProfileApi(sl()));
  sl.registerSingleton<QorgayApi>(QorgayApi(sl()));
  sl.registerSingleton<QuestionnaireApi>(QuestionnaireApi(sl()));
  sl.registerSingleton<MobileModuleApi>(MobileModuleApi(sl()));
  sl.registerSingleton<VitalRulesApi>(VitalRulesApi(sl()));
  sl.registerSingleton<DepartureReportApi>(DepartureReportApi(sl()));

  sl.registerSingleton<ProfileRepository>(ProfileRepositoryImpl(sl()));
  sl.registerSingleton<QorgayRepository>(QorgayRepositoryImpl(sl()));
  sl.registerSingleton<QuestionnaireRepository>(
      QuestionnaireRepositoryImpl(sl()));
  sl.registerSingleton<MobileModuleRepository>(
      MobileModuleRepositoryImpl(sl()));
  sl.registerSingleton<VitalRulesRepository>(
      VitalRulesRepositoryImpl(sl(),sl()));
  sl.registerSingleton<DepartureReportRepository>(
      DepartureReportRepositoryImpl(sl()));


  // Profile UseCases
  sl.registerSingleton<GetProfileUseCase>(GetProfileUseCase(sl()));
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));

  // VitalRules UseCases
  sl.registerSingleton<GetVitalRuleFormUsecase>(GetVitalRuleFormUsecase(sl()));
  sl.registerSingleton<GetVitalRuleCreationPageUsecase>(GetVitalRuleCreationPageUsecase(sl()));
  sl.registerSingleton<GetVitalRuleFormListUsecase>(GetVitalRuleFormListUsecase(sl()));
  sl.registerSingleton<SaveVitalRuleFormUsecase>(SaveVitalRuleFormUsecase(sl()));
  sl.registerSingleton<DeleteVitalRuleFormUsecase>(DeleteVitalRuleFormUsecase(sl()));

  // DepartureReport UseCases
  sl.registerSingleton<GetDepartureReportFormUsecase>(GetDepartureReportFormUsecase(sl()));
  sl.registerSingleton<GetDepartureReportFormListForUserUsecase>(GetDepartureReportFormListForUserUsecase(sl()));
  sl.registerSingleton<GetDepartureReportFormListUsecase>(GetDepartureReportFormListUsecase(sl()));
  sl.registerSingleton<DeleteDepartureReportFormUsecase>(DeleteDepartureReportFormUsecase(sl()));
  sl.registerSingleton<SaveDepartureReportFormUsecase>(SaveDepartureReportFormUsecase(sl()));


  // Qorgay UseCases
  sl.registerSingleton<AddQorgayUseCase>(AddQorgayUseCase(sl()));
  sl.registerSingleton<GetDepartamentsUseCase>(GetDepartamentsUseCase(sl()));
  sl.registerSingleton<GetObservationCategoriesUseCase>(
      GetObservationCategoriesUseCase(sl()));
  sl.registerSingleton<GetObservationTypesUseCase>(
      GetObservationTypesUseCase(sl()));
  sl.registerSingleton<GetQorgaysByUseridUsercase>(
      GetQorgaysByUseridUsercase(sl()));
  sl.registerSingleton<GetOrganizationsUseCase>(GetOrganizationsUseCase(sl()));
  sl.registerSingleton<GetQorgayListUseCase>(GetQorgayListUseCase(sl()));

  // Questionnaire UseCases

  sl.registerSingleton<GetQuestionnairesUseCase>(
      GetQuestionnairesUseCase(sl()));
  sl.registerSingleton<GetQuestionnaireByIdUseCase>(
      GetQuestionnaireByIdUseCase(sl()));
  sl.registerSingleton<SaveQuestionnaireAnswerUseCase>(
      SaveQuestionnaireAnswerUseCase(sl()));
  sl.registerSingleton<GetMobileModulesUseCase>(GetMobileModulesUseCase(sl()));
  sl.registerSingleton<GetMobileModuleFileUseCase>(
      GetMobileModuleFileUseCase(sl()));

  // Blocs
  sl.registerFactory<ProfileBloc>(() => ProfileBloc(sl(), sl(), sl()));

  sl.registerFactory<QuestionnaireBloc>(
      () => QuestionnaireBloc(sl(), sl(), sl()));

  sl.registerFactory<MobileModuleBloc>(() => MobileModuleBloc(sl(), sl()));

  sl.registerFactory<QorgayBloc>(
      () => QorgayBloc(sl(), sl(), sl(), sl(), sl(), sl(),sl()));

  sl.registerFactory<VitalRulesBloc>(
          () => VitalRulesBloc(sl(), sl(), sl(), sl(), sl(),sl()));

  sl.registerFactory<DepartureReportBloc>(
          () => DepartureReportBloc(sl(), sl(), sl(), sl(), sl(),sl()));

  sl.registerFactory<PnbWorkBloc>(
          () => PnbWorkBloc(sl(),sl()));

  sl.registerFactory<PlaceBloc>(
          () => PlaceBloc(sl(),sl()));

  // Cubits
  sl.registerFactory<BottomBarNavigationCubit>(
      () => BottomBarNavigationCubit());
  sl.registerFactory<CreateQorgayCubit>(
          () => CreateQorgayCubit());
  sl.registerFactory<AddReportEntityCubit>(
          () => AddReportEntityCubit());
  sl.registerFactory<CreateAnswerVitalRuleCubit>(
          () => CreateAnswerVitalRuleCubit());
  sl.registerFactory<PnbObservationCubit>(
          () => PnbObservationCubit());
}
