import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsg_loyalty/presentation/blocs/departure-report/departure_report_event.dart';
import 'package:hsg_loyalty/utils/constants/colors.dart';
import '../../domain/entity/list/qorgay_entity.dart';
import '../../injection_container.dart';
import '../../presentation/blocs/departure-report/departure_report_bloc.dart';
import '../../presentation/blocs/departure-report/departure_report_state.dart';
import '../../presentation/blocs/vitalrules/vital_rules_bloc.dart';
import '../../presentation/blocs/vitalrules/vital_rules_event.dart';
import '../../presentation/blocs/vitalrules/vital_rules_state.dart';
import '../constants/constants.dart';
import '../mixins/date_time_mixin.dart';
import 'package:intl/intl.dart';


class ModalHelper with DateTimeMixin {

  static String? _getDataForTitle(String title, QorgayEntity qorgay) {
    switch (title) {
      case "Тип наблюдения":
        return qorgay.dictKorgauObservationTypeId?.toString() ?? "";
      case "Ваши ФИО":
        return qorgay.fullName ?? "Пусто";
      case "Дата и время":
        return _formatTimestamp(qorgay.incidentDatetime ?? DateTime.now().toIso8601String());
      case "Организация/подрядчик":
        return qorgay.organizationId?.toString() ?? "Пусто";
      case "Структурное подразделение":
        return qorgay.supervisedObject ?? "Пусто";
      case "Наблюдаемая компания/участок/объект":
        return qorgay.supervisedOrganizationId?.toString() ?? "Пусто";
      case "Категория наблюдения":
        return qorgay.dictKorgauObservationCategories == [] ? qorgay.dictKorgauObservationCategories?.join('\n') : "Пусто";
      case "Опишите ваше наблюдение/предложение":
        return qorgay.suggestion ?? "Пусто";
      case "Фото/документы с места выявления\nнесоответсвия или предложения":
        return qorgay.files == [] ? qorgay.files?.join('\n') : "Пусто";
      case "Какие возможные последствия или преимущевства хорошей практики / вашего предложения?":
        return qorgay.possibleConsequence ?? "Пусто";
      case "Какие меры вы предприняли?":
        return qorgay.measure ?? "Пусто";
      case "Какие действия вы предприняли для поощрения хорошей практики?":
        return qorgay.actionToEncourage ?? "Пусто";
      case "Обсудили ли вы небезопасное действие / небезопасное поведение с наблюдаемым?":
        return qorgay.isDiscussed! ? "Да" : "Нет";
      case "Сообщили ли ответственному лицу?":
        return qorgay.isInformed! ? "Да" : "Нет";
      case "Кому вы сообщили о наблюдений? (Обязательно заполните для небезопасного действия / небезопасного поведения / опасного фактора / опасного случая)":
        return qorgay.informTo ?? "";
      case "Было ли небезопасное условие / поведение исправлено и опасность устранена?":
        return qorgay.isEliminated! ? "Да" : "Нет";
      default:
        return "Неизвестное поле";
    }
  }

  static String _formatTimestamp(String timestamp) {
    if (timestamp.startsWith("/Date(") && timestamp.endsWith(")/")) {
      try {
        int milliseconds = int.parse(timestamp.substring(6, timestamp.length - 2));
        DateTime date = DateTime.fromMillisecondsSinceEpoch(milliseconds);
        return DateFormat('dd-MM-yyyy').format(date);
      } catch (e) {
        print("Error parsing date: $e");
      }
    }
    return "Invalid Date";
  }

  static void showSuccessAlert(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.sizeOf(context).height / 3,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the modal bottom sheet
                    Navigator.pop(context); // Go back to the previous page
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.gray,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(12),
                  ),
                  child: const Icon(Icons.close, color: Colors.black87),
                ),
              ),
              const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20),
                    Icon(Icons.check_circle_outline,size: 80,color: AppColors.color_green),
                    SizedBox(height: 20),
                    Text(
                      'Ваша карта зарегистрировона',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void showDetailBottomSheetForQorgay(BuildContext context, QorgayEntity qorgay) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.blue),
                    onPressed: () => Navigator.of(context).pop(),
                    color: Colors.grey[300],
                  ),
                ),
                ...inputPageTitles.map((title) {
                  final data = _getDataForTitle(title, qorgay);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: Theme.of(context).textTheme.bodyMedium),
                      Text(data ?? "Пусто", style: Theme.of(context).textTheme.titleMedium),
                      const Divider(color: AppColors.gray),
                    ],
                  );
                }).toList(),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showDetailBottomSheetForVR(BuildContext context, int formId) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider<VitalRulesBloc>(
          create: (context) => sl()..add(GetVitalRuleFormEvent(formId)),
          child: BlocBuilder<VitalRulesBloc, VitalRulesState>(
            builder: (context, state) {
            if (state is VitalRulesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is VitalRulesError) {
              return const Center(child: Text('Что-то пошло не так'));
            } else if (state is VitalRuleDone) {
              final rule = state.userAnswersDtoEntity;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(Icons.close, color: Colors.blue),
                          onPressed: () => Navigator.of(context).pop(),
                          color: Colors.grey[300],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ID", style: Theme.of(context).textTheme.bodyMedium),
                          Text(rule?.id.toString() ?? "", style: Theme.of(context).textTheme.titleMedium),
                          const Divider(color: AppColors.gray),
                          Text("Place of Inspection", style: Theme.of(context).textTheme.bodyMedium),
                          Text(rule?.placeOfInspection ?? "Пусто", style: Theme.of(context).textTheme.titleMedium),
                          const Divider(color: AppColors.gray),
                          Text("ФИО", style: Theme.of(context).textTheme.bodyMedium),
                          Text(rule?.fullName ?? "Пусто", style: Theme.of(context).textTheme.titleMedium),
                          const Divider(color: AppColors.gray),
                          Text("Status of Contract Organization", style: Theme.of(context).textTheme.bodyMedium),
                          Text(rule?.statusOfContractOrganization ?? "Пусто", style: Theme.of(context).textTheme.titleMedium),
                          const Divider(color: AppColors.gray),
                          Text("Organization Name", style: Theme.of(context).textTheme.bodyMedium),
                          Text(rule?.organizationName ?? "Пусто", style: Theme.of(context).textTheme.titleMedium),
                          const Divider(color: AppColors.gray),

                          Text("Email", style: Theme.of(context).textTheme.bodyMedium),
                          Text(rule?.email ?? "Пусто", style: Theme.of(context).textTheme.titleMedium),
                          const Divider(color: AppColors.gray),
                          Text("organizationName", style: Theme.of(context).textTheme.bodyMedium),
                          Text(rule?.organizationName ?? "Пусто", style: Theme.of(context).textTheme.titleMedium),
                          const Divider(color: AppColors.gray),
                          Text("Structural Subdivision", style: Theme.of(context).textTheme.bodyMedium),
                          Text(rule?.structuralSubdivision ?? "Пусто", style: Theme.of(context).textTheme.titleMedium),
                          const Divider(color: AppColors.gray),
                          Text("Travel Date", style: Theme.of(context).textTheme.bodyMedium),
                          Text(_formatTimestamp(rule?.travelDate ?? "") ?? "Пусто", style: Theme.of(context).textTheme.titleMedium),
                          const Divider(color: AppColors.gray),
                          Text("User Answers", style: Theme.of(context).textTheme.bodyMedium),
                          Text((rule?.userAnswers?.join("\n") != "" ? rule?.userAnswers?.join("\n") : "Пусто") ?? "Пусто", style: Theme.of(context).textTheme.titleMedium),
                          const Divider(color: AppColors.gray),
                          Text("Comments", style: Theme.of(context).textTheme.bodyMedium),
                          Text((rule?.comments?.join("\n") != "" ? rule?.userAnswers?.join("\n") : "Пусто") ?? "Пусто", style: Theme.of(context).textTheme.titleMedium),
                          const Divider(color: AppColors.gray),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(child: Text('Неизвестное состояние'));
            }
          },
        ),
);
      },
    );
  }

  static void showDetailBottomSheetForDepartureReport(BuildContext context, int userId) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider<DepartureReportBloc>(
          create: (context) => sl()..add(GetDepartureReportEvent(userId)),
          child: BlocBuilder<DepartureReportBloc, DepartureReportState>(
            builder: (context, state) {
              if (state is DepartureReportLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DepartureReportError) {
                return const Center(child: Text('Что-то пошло не так'));
              } else if (state is DepartureReportDone) {
                final report = state.departureReportEntity;

                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: const Icon(Icons.close, color: Colors.blue),
                            onPressed: () => Navigator.of(context).pop(),
                            color: Colors.grey[300],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildField("Id", report!.id.toString(), context),
                            const Divider(color: AppColors.gray),
                            _buildField(
                                "UserId", report.userId.toString(), context),
                            const Divider(color: AppColors.gray),
                            _buildField("CompanyId",
                                report.companyId.toString(), context),
                            const Divider(color: AppColors.gray),
                            _buildField("AuthorFullName",
                                report.authorFullName ?? "Пусто", context),
                            const Divider(color: AppColors.gray),
                            _buildField("CompanyName",
                                report.companyName ?? "Пусто", context),
                            const Divider(color: AppColors.gray),
                            _buildField("DepartureDate",
                                _formatTimestamp(report.departureDate ?? ""), context),
                            const Divider(color: AppColors.gray),
                            _buildField(
                                "Topic", report.topic ?? "Пусто", context),
                            const Divider(color: AppColors.gray),
                            _buildField("PeopleCount",
                                report.peopleCount.toString(), context),
                            const Divider(color: AppColors.gray),
                            _buildField("Questions",
                                report.questions ?? "Пусто", context),
                            const Divider(color: AppColors.gray),
                            _buildField("Decisions",
                                report.decisions ?? "Пусто", context),
                            const Divider(color: AppColors.gray),
                            _buildField("File",
                                report.file?.join(' ') ?? "Пусто", context),
                            const Divider(color: AppColors.gray),
                            _buildField(
                                "Place", report.place ?? "Пусто", context),
                            const Divider(color: AppColors.gray),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(child: Text('Неизвестное состояние'));
              }
            },
          ),
        );
      },
    );
  }

  static Widget _buildField(String label, String value, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        Text(value, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}
